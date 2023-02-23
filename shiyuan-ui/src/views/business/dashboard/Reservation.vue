<!-- 订单预约和订单上钟信息 -->
<template>
    <el-row :gutter="20">
        <el-col :xs="24" :sm="24" :md="24" :lg="24">
            <el-tabs type="border-card" v-model="activeName" @tab-click="handleTabsClick(activeName)">
                <el-tab-pane name="first">
                    <span slot="label"><i class="el-icon-date"></i> 预约</span>
                    <el-col :xs="24" :sm="24" :md="24" :lg="12">
                        <el-card class="box-card">
                            <div slot="header" class="clearfix">
                                <span>预约列表</span>
                                <el-button style="float: right; padding: 3px 0" type="text"  @click="handleYuYueAdd">新增预约</el-button>
                            </div>
                            <el-table stripe v-loading="yuYueLoading" :data="yuYueOrderList">
                                <el-table-column label="师傅名称" align="center" prop="artificerName" />
                                <el-table-column label="客户姓名" align="center" prop="customerName" :show-overflow-tooltip="true" />
                                <el-table-column label="预约时间" align="center" prop="startTime" >
                                    <template slot-scope="scope">
                                    <span>{{ parseTime(scope.row.startTime, '{h}:{i}') }}</span>
                                    </template>
                                </el-table-column>
                                <el-table-column label="下钟时间" align="center" prop="endTime" >
                                <template slot-scope="scope">
                                    <span>{{ parseTime(scope.row.endTime, '{h}:{i}') }}</span>
                                    </template>
                                </el-table-column>
                                <el-table-column label="备注" align="center" prop="remark" :show-overflow-tooltip="true" />
                                <el-table-column label="操作" align="center" class-name="small-padding fixed-width" :min-width=150>
                                    <template slot-scope="scope">
                                        <el-button
                                            size="mini"
                                            type="text"
                                            icon="el-icon-plus"
                                            @click="handleYuYueAndKaiDan(scope.row)"
                                            >开单
                                        </el-button>
                                        <el-button
                                            size="mini"
                                            type="text"
                                            icon="el-icon-edit"
                                            @click="handleUpdate(scope.row)"
                                        >修改</el-button>
                                        <el-button
                                            size="mini"
                                            type="text"
                                            icon="el-icon-delete"
                                            @click="handleDelete(scope.row)"
                                        >删除</el-button>
                                    </template>
                                </el-table-column>
                            </el-table>
                        </el-card>
                    </el-col>
                    <el-col :xs="24" :sm="24" :md="24" :lg="12">
                        <el-card class="box-card">
                            <div slot="header" class="clearfix">
                                <span>上钟列表</span>
                                <el-button style="float: right; padding: 3px 0" type="text" @click="handleKaiDanOrder">新增开单</el-button>
                            </div>
                            <el-table stripe v-loading="kaiDanLoading" :data="kaiDanOrderList">
                                <el-table-column label="师傅名称" align="center" prop="artificerName" />
                                <el-table-column label="客户姓名" align="center" prop="customerName" :show-overflow-tooltip="true"/>
                                <el-table-column label="开单时间" align="center" prop="startTime" >
                                    <template slot-scope="scope">
                                    <span>{{ parseTime(scope.row.startTime, '{h}:{i}') }}</span>
                                    </template>
                                </el-table-column>
                                <el-table-column label="下钟时间" align="center" prop="endTime" >
                                <template slot-scope="scope">
                                    <span>{{ parseTime(scope.row.endTime, '{h}:{i}') }}</span>
                                    </template>
                                </el-table-column>
                                <el-table-column label="备注" align="center" prop="remark" :show-overflow-tooltip="true"/>
                                <el-table-column label="操作" align="center" class-name="small-padding fixed-width" :min-width=150 >
                                    <template slot-scope="scope">
                                        <el-button
                                            size="mini"
                                            type="text"
                                            icon="el-icon-plus"
                                            @click="handlePayment(scope.row)"
                                            >结账
                                        </el-button>
                                        <el-button
                                            size="mini"
                                            type="text"
                                            icon="el-icon-edit"
                                            @click="handleUpdate(scope.row)"
                                        >修改</el-button>
                                        <el-button
                                            size="mini"
                                            type="text"
                                            icon="el-icon-delete"
                                            @click="handleDelete(scope.row)"
                                        >删除</el-button>
                                    </template>
                                </el-table-column>
                            </el-table>
                        </el-card>
                    </el-col>
                </el-tab-pane>
                <el-tab-pane name="second">
                    <span slot="label"><i class="el-icon-monitor"></i> 统计</span>
                    <el-col :xs="24" :sm="24" :md="24" :lg="24">
                        <el-card class="box-card">
                            <el-form :model="queryParams" ref="queryForm" size="small" :inline="true"  label-width="68px">
                                <el-form-item label="时间选择">
                                    <el-date-picker
                                      v-model="dateRange"
                                      style="width: 240px"
                                      value-format="yyyy-MM-dd"
                                      type="daterange"
                                      range-separator="-"
                                      start-placeholder="开始日期"
                                      end-placeholder="结束日期"
                                    ></el-date-picker>
                                </el-form-item>
                                <el-form-item>
                                    <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
                                    <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
                                </el-form-item>
                            </el-form>
                            <el-table stripe v-loading="tongJiLoading" :data="tongJiOrderList">
                                <el-table-column label="师傅名称" align="center" prop="artificerName" />
                                <el-table-column label="点钟" align="center" prop="dianZhongTotal"  />
                                <el-table-column label="排钟" align="center" prop="paiZhongTotal" />
                                <el-table-column label="辅助项目" align="center" prop="fuZhuAdditionalDetail"  :show-overflow-tooltip="true" :min-width=340 />
                                <el-table-column label="非会员收入" align="center" prop="orderAmountTotal" />
                                <el-table-column label="收入明细" align="center" prop="zhuAdditionalDetail" :show-overflow-tooltip="true" :min-width=340 />
                            </el-table>
                        </el-card>
                    </el-col>
                </el-tab-pane>
                <el-tab-pane name="third">
                    <span slot="label"><i class="el-icon-time"></i> 排钟</span>
                    排钟
                </el-tab-pane>
            </el-tabs>
        </el-col>
        <!-- 添加或修改订单信息对话框 -->
        <el-dialog :title="yuYuetitle" :visible.sync="yuYueOpen" width="850px" append-to-body>
        <el-form ref="yuYueForm" :model="yuYueForm" :rules="yuYueRules" label-width="90px">
            <el-row>
                <el-col :span="12">
                <el-form-item label="预约时间" prop="startTime">
                    <el-date-picker
                    v-model="yuYueForm.startTime"
                    type="datetime"
                    value-format="yyyy-MM-dd HH:mm"
                    placeholder="请选择开始时间">
                    </el-date-picker>
                </el-form-item>
                </el-col>
                <el-col :span="12">
                <el-form-item label="服务项目" prop="additionalId">
                    <el-select v-model="yuYueForm.additionalId" placeholder="请选择服务项目"
                    @change="selectAdditionalName($event)"
                    >
                    <el-option
                        v-for="item in zhuAdditionalList"
                        :key="item.additionalId"
                        :label="item.additionalName"
                        :value="item.additionalId"
                    ></el-option>
                    </el-select>
                </el-form-item>
                </el-col>
            </el-row>
            <el-row>
                <el-col :span="12">
                    <el-form-item label="结束时间" prop="endTime">
                        <el-date-picker
                        v-model="yuYueForm.endTime"
                        type="datetime"
                        value-format="yyyy-MM-dd HH:mm"
                        placeholder="请选择结束时间">
                        </el-date-picker>
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="是否会员" prop="">
                       <el-radio-group v-model="isMember">
                            <el-radio
                            v-for="item in isMemberList"
                            :key="item.value"
                            :label="item.value"
                            @change="selectIsMemberChange($event)"
                            >{{item.label}}</el-radio>
                        </el-radio-group>
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row>
                <el-col :span="24" v-if="memberInfoDataView">
                    <el-form-item label="会员搜索">
                    <el-autocomplete  style="width:100%"
                        v-model="yuYueForm.customerName"
                        :fetch-suggestions="memberSearchAsync"
                        @select="handleMemberSelect"
                        placeholder="请输入会员姓名、手机号"
                        >
                        <template slot-scope="{item}">
                        <div class="autocomplete-choose-name" v-html="htmlValue(item)"></div>
                        </template>
                    </el-autocomplete>
                    </el-form-item>
                </el-col>
                <el-col :span="24" v-else>
                    <el-form-item label="客户姓名" prop="customerName">
                        <el-input v-model="yuYueForm.customerName" placeholder="请输入客户姓名及手机号" />
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row v-if="memberInfoDataView">
                <el-col :span="24">
                    <el-form-item label="会员信息" prop="customerName">
                        <el-button size="medium" type="primary">{{memberInfoData}}</el-button>
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row>
                <el-col :span="12">
                    <el-form-item label="排钟类型" prop="bellType">
                        <el-select v-model="yuYueForm.bellType" placeholder="请选择排钟类型">
                        <el-option
                            v-for="dict in dict.type.b_order_bell_type"
                            :key="dict.value"
                            :label="dict.label"
                            :value="dict.value"
                        ></el-option>
                        </el-select>
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="预约技师" prop="artificerId">
                        <el-select v-model="yuYueForm.artificerId" placeholder="请选择技师名称"
                        @change="selectArtificerName($event)"
                        >
                        <el-option
                            v-for="item in artificerList"
                            :key="item.artificerId"
                            :label="item.artificerName"
                            :value="item.artificerId"
                            :disabled="item.bellState"
                        ></el-option>
                        </el-select>
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row>
                <el-col :span="24">
                    <el-form-item label="备注" prop="remark">
                        <el-input v-model="yuYueForm.remark" type="textarea" placeholder="请输入备注" />
                    </el-form-item>
                </el-col>
            </el-row>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button v-if="yuYueOrKaiDanView" type="primary" @click="submitYuYueForm">保 存</el-button>
            <el-button v-else type="primary" @click="submityuYueAndKaiDanForm">确认开单</el-button>
            <el-button @click="cancelyuYueForm">取 消</el-button>
        </div>
        </el-dialog>
        <!-- 开单弹窗 -->
        <jieZhangOrder  v-if="jieZhangOrderFormView" :jieZhangForm="jieZhangForm" @handleCancelJieView="handleCancelJieView" />
    </el-row>
</template>


<script>
import { orderDataList, getOrder, delOrder, addOrder, updateOrder } from "@/api/business/order";
import { additionalList,getAdditional } from "@/api/business/additional";
import { getArtificerList} from "@/api/business/artificer";
import { memberList, getMember } from "@/api/business/member";
import { artificerStatistics } from "@/api/business/index";
import JieZhangOrder from '../../business/dashboard/JieZhangOrder'

export default {
  name: "index",
  dicts: ['b_order_bell_type'],
  components: {
    JieZhangOrder
  },
  data() {
    return {
        // 默认选项卡选中第一个
        activeName: 'first',
        // 预约列表遮罩层
        yuYueLoading: true,
        //预约订单列表数据
        yuYueOrderList:[],
        // 预约显示弹窗状态
        yuYueOpen:false,
        // 预约弹窗标题
        yuYuetitle:"",
        // 是否是会员预约
        isMember:1,
        // 会员非会员
        isMemberList:[
            {
                value: 1,
                label: "会员"
            },
            {
                value:  2,
                label: "非会员"
            }
        ],
        // 是否显示会员信息
        memberInfoDataView: true,
        // 会员信息回显数据
        memberInfoData:"",
        // 预约表单
        yuYueForm:{
            // 预约时间
            startTime:null,
             // 服务项目
            additionalId:null,
             // 下钟时间
            endTime:null,
            // 客户姓名
            customerName:"",
            //会员id
            memberId:null,
            //排钟类型
            bellType:null,
            // 技师id
            artificerId:null,
            // 备注
            remark:null,

        },
        // 预约校验字段
        yuYueRules:{
            startTime:[ { required: true, message: "预约时间不能为空", trigger: "blur" }],
            endTime:[ { required: true, message: "下钟时间不能为空", trigger: "blur" }],
            additionalId:[ { required: true, message: "服务项目不能为空", trigger: "blur" }],
            customerName:[ { required: true, message: "客户姓名不能为空", trigger: "blur" }],
            artificerId:[ { required: true, message: "预约技师不能为空", trigger: "blur" }],
        },
        // 预约列表遮罩层
        kaiDanLoading: true,
        // 预约提交，预约转开单展示
        yuYueOrKaiDanView:true,
        //开单订单列表数据
        kaiDanOrderList:[],
        //主服务项目列表
        zhuAdditionalList: [],
        // 技师列表
        artificerList: [],
        // 结账弹窗显示状态
        jieZhangOrderFormView: false,
        // 结账弹窗表单
        jieZhangForm: {},

        /** 统计 字段*/
        // 统计列表遮罩层
        tongJiLoading:true,
        // 日期范围
        dateRange: [
            this.parseTime(new Date(), '{y}-{m}-{d}'),
            this.parseTime(new Date(), '{y}-{m}-{d}')
        ],
        // 统计师傅订单列表
        tongJiOrderList:[],
        // 查询参数
        queryParams: {},
    };
  },
  created(){
    // 加载预约列表数据
    this.getYuYueOrderList();
    // 加载开单订单列表
    this.getKaiDaneOrderList();
  },
  methods: {
    // 选项卡操作事件
    handleTabsClick(activeName) {
        if(activeName == 'second'){
            this.getArtificerStatistics();
        }else if(activeName == 'third'){
            console.log(activeName);
        }else{
            // 加载预约列表数据
            this.getYuYueOrderList();
            // 加载开单订单列表
            this.getKaiDaneOrderList();
        }
    },
    // 加载预约列表数据
    getYuYueOrderList(){
        this.yuYueLoading = true;
        // 查询参数
        const queryParams= {
            orderState: '0', // 订单状态 0：预约中；1：已开单；2：已支付
            params:{
            'orderSort':"end_time DESC"
            },
        };
        orderDataList(queryParams).then(response => {
            this.yuYueOrderList = response.data;
            this.yuYueLoading = false;
        });
    },
    // 加载开单订单列表
    getKaiDaneOrderList(){
        this.kaiDanLoading = true;
        // 查询参数
        const queryParams= {
            orderState: '1', // 订单状态 0：预约中；1：已开单；2：已支付
            params:{
            'orderSort':"end_time DESC"
            },
        };
        orderDataList(queryParams).then(response => {
            this.kaiDanOrderList = response.data;
            this.kaiDanLoading = false;
        });
    },
    // 结账弹窗
    handlePayment(row){
        this.jieZhangOrderFormView = true;
        this.jieZhangForm = row;
    },
    // 子组件调用父组件
    handleCancelJieView(type){
        this.jieZhangOrderFormView = false;
        if(type == 'save'){
            this.getKaiDaneOrderList();
        }
    },

    // 表单重置
    resetyuYueForm() {
      this.memberInfoData=null;
      this.yuYueForm = {
        // 预约时间
        startTime:null,
        // 服务项目
        additionalId:null,
        // 下钟时间
        endTime:null,
        // 客户姓名
        customerName:"",
        //会员id
        memberId:null,
        //排钟类型
        bellType:null,
        // 技师id
        artificerId:null,
        // 备注
        remark:null,

      };
      this.resetForm("yuYueForm");
    },
    // 新增预约
    handleYuYueAdd(){
        // 显示预约弹窗标题
        this.yuYuetitle="新增预约信息";
        // 重置预约表单
        this.resetyuYueForm();
        // 重置会员回显
        this.memberInfoData=null;
        // 加载主服务项目
        this.getZhuAdditionalList();
        // 加载技师信息
        this.getArtificerListData();
        // 回显预约按钮
        this.yuYueOrKaiDanView = true;
        // 显示预约弹窗
        this.yuYueOpen = true;
    },
    // 预约转开单
    handleYuYueAndKaiDan(row){
         // 加载主服务项目
        this.getZhuAdditionalList();
        // 加载技师信息
        this.getArtificerListData();
        this.resetyuYueForm();
        const orderId = row.orderId || this.ids
        getOrder(orderId).then(response => {
            this.yuYueForm = response.data;
            // 重新赋值预约时间和下钟时间
            this.yuYueForm.startTime = this.parseTime(new Date(),"{y}-{m}-{d} {h}:{i}");
            // 重新计算订单结束时间
            getAdditional(this.yuYueForm.additionalId).then(response => { // 根据订单信息关联的服务项目id查询服务项目信息，计算订单结束时间
                const additionalInfo = response.data;
                const entTime = this.$moment(this.yuYueForm.startTime).add(additionalInfo.duration,'minutes').format("YYYY-MM-DD HH:mm");// 通过this.$moment() 计算日期的加减和格式化
                this.yuYueForm.endTime = entTime ;
            });
            /** 判断是会员预约还是非会员预约 */
            if(this.yuYueForm.memberId != null && this.yuYueForm.memberId != 0){ // 会员预约
                this.isMember = 1;
                this.memberInfoDataView=true;
                getMember(this.yuYueForm.memberId).then(response => {
                    const memberInfo = response.data;
                    this.memberInfoData = memberInfo.memberName +" "+ memberInfo.memberPhonenumper +" "+memberInfo.memberCardName +" "+ memberInfo.surplusAmount ;
                    if(memberInfo.remark){
                        this.memberInfoData = this.memberInfoData+ " 备注："+ memberInfo.remark;
                    }
                });
            }else{ // 非会员预约
                this.isMember = 2;
                this.memberInfoDataView=false;
            }
            // 回显预约转开单按钮
            this.yuYueOrKaiDanView = false;
            this.yuYueOpen = true;
            this.yuYuetitle = "预约转开单订单信息";
        });
    },
    // 订单修改
    handleUpdate(row){
        // 加载主服务项目
        this.getZhuAdditionalList();
        // 加载技师信息
        this.getArtificerListData();
        if(row.orderState == '0'){
            this.resetyuYueForm();
            const orderId = row.orderId || this.ids
            getOrder(orderId).then(response => {
                this.yuYueForm = response.data;
                if(this.yuYueForm.memberId != null && this.yuYueForm.memberId !=0){ // 会员预约,默认会员不等于0
                    this.isMember = 1;
                    this.memberInfoDataView=true;
                    getMember(this.yuYueForm.memberId).then(response => {
                        const memberInfo = response.data;
                        this.memberInfoData = memberInfo.memberName +" "+ memberInfo.memberPhonenumper +" "+memberInfo.memberCardName +" "+ memberInfo.surplusAmount ;
                        if(memberInfo.remark){
                            this.memberInfoData = this.memberInfoData+ " 备注："+ memberInfo.remark;
                        }
                    });
                }else{ // 非会员预约
                    this.isMember = 2;
                    this.memberInfoDataView=false;
                }
                // 回显预约按钮
                this.yuYueOrKaiDanView = true;
                this.yuYueOpen = true;
                this.yuYuetitle = "修改预约订单信息";
            });
        }else{
            this.resetyuYueForm();
            const orderId = row.orderId || this.ids
            getOrder(orderId).then(response => {
                this.yuYueForm = response.data;
                if(this.yuYueForm.memberId != null && this.yuYueForm.memberId != 0){ // 会员预约
                    this.isMember = 1;
                    this.memberInfoDataView=true;
                    getMember(this.yuYueForm.memberId).then(response => {
                        const memberInfo = response.data;
                        this.memberInfoData = memberInfo.memberName +" "+ memberInfo.memberPhonenumper +" "+memberInfo.memberCardName +" "+ memberInfo.surplusAmount ;
                        if(memberInfo.remark){
                            this.memberInfoData = this.memberInfoData+ " 备注："+ memberInfo.remark;
                        }
                    });
                }else{ // 非会员预约
                    this.isMember = 2;
                    this.memberInfoDataView=false;
                }
                // 回显预约按钮
                this.yuYueOrKaiDanView = true;
                this.yuYueOpen = true;
                this.yuYuetitle = "修改上钟订单信息";
            });
        }
    },
    //订单删除
    handleDelete(row){
        const orderIds = row.orderId || this.ids;
        if(row.orderState == '0'){
            this.$modal.confirm('是否确认删除预约订单信息编号为"' + orderIds + '"的数据项？').then(function() {
                return delOrder(orderIds);
            }).then(() => {
                this.getYuYueOrderList();
                this.$modal.msgSuccess("删除成功");
            }).catch(() => {});
        }else{
            this.$modal.confirm('是否确认删除上钟订单信息编号为"' + orderIds + '"的数据项？').then(function() {
                return delOrder(orderIds);
            }).then(() => {
                this.getKaiDaneOrderList();
                this.$modal.msgSuccess("删除成功");
            }).catch(() => {});
        }
    },
    // 保存预约信息
    submitYuYueForm(){
        this.$refs["yuYueForm"].validate(valid => {
          if (valid) {
            if(this.isMember == 2){ //非会员预约 
                // 置空会员信息
                this.yuYueForm.memberId = 0; 
            }
            if(this.yuYueForm.orderId != null){
                updateOrder(this.yuYueForm).then(response => {
                    this.$modal.msgSuccess("预约修改成功");
                    this.yuYueOpen = false;
                    if(this.yuYueForm.orderState == '0'){
                        // 加载预约列表数据
                        this.getYuYueOrderList();
                    }else{
                        // 加载预约列表数据
                        this.getKaiDaneOrderList();
                    }
                    
                });
            }else{
                this.yuYueForm.orderState = '0' // 赋值订单状态 订单状态  0：预约中；1：已开单；2：已支付
                addOrder(this.yuYueForm).then(response => {
                    this.$modal.msgSuccess("预约添加成功");
                    this.yuYueOpen = false;
                    // 加载预约列表数据
                    this.getYuYueOrderList();
                });
            }
          }
        })
    },
    // 保存预约转开单信息
    submityuYueAndKaiDanForm(row){
        this.$refs["yuYueForm"].validate(valid => {
          if (valid) {
            if(this.isMember == 2){ //非会员预约 
                // 置空会员信息为0
                this.yuYueForm.memberId = 0; 
            }
            this.yuYueForm.orderState = '1' // 赋值订单状态 订单状态  0：预约中；1：已开单；2：已支付
            updateOrder(this.yuYueForm).then(response => {
                this.$modal.msgSuccess("预约转开单保存成功");
                this.yuYueOpen = false;
                // 加载预约列表数据
                this.getYuYueOrderList();
                // 加载上钟列表数据
                this.getKaiDaneOrderList();
            });
          }
        })
    },
    // 取消预约按钮
    cancelyuYueForm() {
        // 重置预约表单
        this.resetyuYueForm();
        // 隐藏预约表单
        this.yuYueOpen = false;
      },
    /** 上钟列表新增开单 */
    handleKaiDanOrder () { 
        this.$parent.handleKaiDanOrder('add');// 调用父组件的方法
    },
      
    /** 查询主服务和附加项项目列表 1：主服务；2：附加项*/
    getZhuAdditionalList(){
        const params = {dataType:1};
        additionalList(params).then(response => {
          this.zhuAdditionalList = response.data;
        })
    },
    /** 查询主服务和附加项项目列表 1：主服务；2：附加项*/
    getFuZhuAdditionalList(){
        const params = {dataType:2};
        additionalList(params).then(response => {
          this.fuZhuAdditionalList = response.data;
        })
    },
     /**监听服务项目下拉事件获取label的值 */
    selectAdditionalName(val){//这个val也就是value值
      let obj = this.zhuAdditionalList.find(item => item.additionalId === val);
      // 判断的时候可以直接写obj而不需要以判断对象是否为空的方式是因为：如果找不到，find方法返回的是undefined而不是空对象
      if(obj) {
        //赋值服务项目名称
        this.yuYueForm.additionalName= obj.additionalName;
        // 赋值订单金额
        this.yuYueForm.orderAmount = obj.additionalAmount
        if(this.yuYueForm.startTime){
          const entTime = this.$moment(this.yuYueForm.startTime).add(obj.duration,'minutes').format("YYYY-MM-DD HH:mm");// 通过this.$moment() 计算日期的加减和格式化
          this.yuYueForm.endTime = entTime ;
        }else{
          this.yuYueForm.additionalId=null;
          this.yuYueForm.additionalName=null;
          this.$modal.alertWarning("请先选择预约时间");
        }
      }
    },
    /** 查询技术人员列表 */
    getArtificerListData(){
      getArtificerList(this.queryParams).then(response => {
        this.artificerList = response.data;
      });
    },
    /**监听开单技师下拉事件获取label的值 */
    selectArtificerName(val){//这个val也就是value值
      console.log(val)
      let obj = this.artificerList.find(item => item.artificerId === val);
      // 判断的时候可以直接写obj而不需要以判断对象是否为空的方式是因为：如果找不到，find方法返回的是undefined而不是空对象
      if(obj) {
        this.yuYueForm.artificerName= obj.artificerFullName;
      }
    },
    /** 判断当前选中的是否为会员或者非会员 */
    selectIsMemberChange(val){
        if(val == 1){
            this.memberInfoDataView =true;
        }else {
            this.memberInfoDataView =false;
        }
    },
    /** 会员信息预搜索 */
    memberSearchAsync(queryString, callback) {
        const params={searchValue: queryString};
        memberList(params).then(response => {
          let results = queryString ? response.data.filter(this.createmeMberNameFilter(queryString)) : response.data;
          callback(results); // 回调匹配结果
      })
    },
    // 创建过滤器 适配大小写
    createmeMberNameFilter(queryString) {
      // 搜索框匹配的对象
      return (item) => {
        let searchValueTemp = item.memberName +" "+ item.memberPhonenumper +" "+item.memberCardName +" "+ item.surplusAmount;
        return (searchValueTemp.toLowerCase().indexOf(queryString.toLowerCase()) >= 0);
      };
    },
    // 会员搜索候选词高亮设定
    htmlValue(item) {
      let key = this.yuYueForm.customerName;
      let searchValueTemp = item.memberName +" "+ item.memberPhonenumper +" "+item.memberCardName +" "+ item.surplusAmount;
      if (key.length > 0) {
        return searchValueTemp.replace(
        new RegExp(key, "g"),
        "<span style='color:red;'>" + key + "</span>"
        );
      }
      return searchValueTemp;
    },
    // 会员信息选中赋值
    handleMemberSelect(item){
      // 会员信息回显
      this.memberInfoDataView = true;
      // 选中会员id赋值
      this.yuYueForm.memberId = item.memberId;
      // 选中会员的名称赋值
      this.yuYueForm.customerName = item.memberName;
      // 回显选中的会员信息
      this.memberInfoData = item.memberName +" "+ item.memberPhonenumper +" "+item.memberCardName +" "+ item.surplusAmount ;
      if(item.remark){
        this.memberInfoData = item.memberName +" "+ item.memberPhonenumper +" "+item.memberCardName +" "+ item.surplusAmount + " 备注："+ item.remark;
      }
    },
    /**  首页统计功能--技师结单统计 */
    /** 搜索按钮操作 */
    handleQuery() {
      this.getArtificerStatistics();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    getArtificerStatistics(){
        this.tongJiLoading = true;
        artificerStatistics(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
            this.tongJiOrderList = response.data;
            this.tongJiLoading = false;
        })
    },

  },
};
</script>

<style lang="scss">

</style>
