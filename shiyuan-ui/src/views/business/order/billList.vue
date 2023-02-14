<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="排钟类型" prop="bellType">
        <el-select v-model="queryParams.bellType" placeholder="请选择排钟类型" clearable>
          <el-option
            v-for="dict in dict.type.b_order_bell_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="服务项目" prop="additionalId">
        <el-select v-model="queryParams.additionalId" placeholder="请选择服务项目" clearable>
          <el-option
            v-for="item in zhuAdditionalList"
            :key="item.additionalId"
            :label="item.additionalName"
            :value="item.additionalId"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="技师名称" prop="artificerId">
        <el-select v-model="queryParams.artificerId" placeholder="请选择技师名称" clearable>
          <el-option
            v-for="item in artificerList"
            :key="item.artificerId"
            :label="item.artificerName"
            :value="item.artificerId"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="开单时间">
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
    <el-table stripe v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序号" align="center" prop="index" >
        <template slot-scope="scope">
          <span>{{ scope.$index + 1}}</span>
        </template>
      </el-table-column>
      <el-table-column label="开始时间" align="center" prop="startTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="结束时间" align="center" prop="endTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="订单金额" align="center" prop="orderAmount" />
      <el-table-column label="订单状态" align="center" prop="orderState">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.b_order_state" :value="scope.row.orderState"/>
        </template>
      </el-table-column>
       <el-table-column label="开单技师" align="center" prop="artificerName" />
      <el-table-column label="排钟类型" align="center" prop="bellType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.b_order_bell_type" :value="scope.row.bellType"/>
        </template>
      </el-table-column>
      <el-table-column label="服务项目" align="center" prop="additionalName" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" :min-width=150>
        <template slot-scope="scope">
          <el-button
              size="small"
              type="success"
              round
              icon="el-icon-view"
              @click="handleDetails(scope.row)"
              v-hasPermi="['business:order:payment']"
            >详情
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 订单详情信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="950px" append-to-body>
      <el-form ref="form" :model="orderInfo" :rules="rules" label-width="90px">
         <el-row>
            <el-col :span="12">
              <el-form-item label="开单时间" prop="startTime">
                <el-input v-model="orderInfo.startTime" :readonly="true" />
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="结单时间" prop="endTime">
                <el-input v-model="orderInfo.endTime" :readonly="true" />
              </el-form-item>
            </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="服务项目" prop="additionalId">
              <el-input v-model="orderInfo.additionalName" :readonly="true" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="辅助项目" prop="additionalIds">
              <el-checkbox-group v-model="additionalIds"  >
                <el-checkbox
                  v-for="item in fuZhuAdditionalList"
                  :key="item.additionalId"
                  :value="item.additionalId"
                  :label="item.additionalId"
                  :disabled="item.disabled"
                >
                {{item.additionalName}}
                </el-checkbox>
              </el-checkbox-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="账单金额" prop="artificerId">
              <el-input v-model="orderInfo.orderAmount" :readonly="true"  />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="结账类型" prop="paymentType">
              <el-select v-model="orderInfo.paymentType" :disabled="true" >
                <el-option
                  v-for="dict in dict.type.b_order_payment_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="开单技师" prop="artificerName">
              <el-input v-model="orderInfo.artificerName" :readonly="true"  />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="排钟类型" prop="bellType">
              <el-select v-model="orderInfo.bellType" :disabled="true">
                <el-option
                  v-for="dict in dict.type.b_order_bell_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="memberInfoView">
          <el-col :span="24">
            <el-form-item label="会员信息" prop="memberName">
              <el-input v-model="bMemberInfo.memberName"  :readonly="true"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="memberInfoView">
           <el-col :span="12">
            <el-form-item label="剩余金额" prop="surplusAmount">
              <el-input v-model="bMemberInfo.surplusAmount" :readonly="true"  />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="剩余次数" prop="surplusTimes">
              <el-input v-model="bMemberInfo.surplusTimes" :readonly="true"  />
            </el-form-item>
          </el-col>
        </el-row> 
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
import { listOrder, getOrderInfoDetails } from "@/api/business/order";
import { additionalList } from "@/api/business/additional";
import { getArtificerList} from "@/api/business/artificer";

export default {
  name: "Order",
  dicts: ['b_additional_type', 'b_order_bell_type', 'b_order_state','b_order_payment_type'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 订单信息表格数据
      orderList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 日期范围
      dateRange: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderState: '2', // 订单状态  0：预约中；1：已开单；2：已支付
        bellType: null,
        additionalId: null,
        artificerId: null,
        artificerName: null,
        params:{
          'orderSort':"create_time DESC"
        },
      },
      // 辅助项目集合
      additionalIds:[],
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
      // 订单对象
      orderInfo:{},
      //主服务项目列表
      zhuAdditionalList: [],
      // 辅助项目列表
      fuZhuAdditionalList: [],
      // 技师列表
      artificerList: [],
      // 会员对象信息
      bMemberInfo:{
        memberName:null,
        surplusAmount:null,
        surplusTimes:null,
      },
      // 会员信息是否回显
      memberInfoView:false,
    };
  },
  created() {
    this.getList();
    this.getZhuAdditionalList();
    this.getArtificerListDat();
  },
  methods: {
    /** 查询订单信息列表 */
    getList() {
      this.loading = true;
      listOrder(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.orderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.additionalIds=[];
      this.fuZhuAdditionalList=[];
      this.memberInfoView=false;
      this.bMemberInfo={
        memberName:null,
        surplusAmount:null,
        surplusTimes:null,
      };
      this.orderInfo = {
        orderId: null,
        startTime: null,
        endTime: null,
        orderAmount: null,
        orderState: null,
        bellType: null,
        additionalId: null,
        additionalName: null,
        artificerId: null,
        artificerName: null,
        createTime: null,
        createBy: null,
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.orderId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleDetails(row) {
      this.reset();
      // 加载辅助项目列表
      this.getFuZhuAdditionalList();
      // 查询订单详情
      getOrderInfoDetails(row.orderId).then(response =>{
        this.orderInfo = response.data;
        if(response.data.params.bMemberInfo){
          this.memberInfoView = true;
          this.bMemberInfo = response.data.params.bMemberInfo;
          this.bMemberInfo.memberName = this.bMemberInfo.memberName +" "+ this.bMemberInfo.memberPhonenumper +" "+this.bMemberInfo.memberCardName +" "+ this.bMemberInfo.surplusAmount + " 备注："+ this.bMemberInfo.remark;
        }
        if(response.data.params.additionalIds){
          this.additionalIds = response.data.params.additionalIds;
          for(let i =0; i <this.fuZhuAdditionalList.length; i++){
            if(this.additionalIds.includes(this.fuZhuAdditionalList[i].additionalId)){
              this.$set(this.fuZhuAdditionalList[i],'disabled',false);
            }else{
              this.$set(this.fuZhuAdditionalList[i],'disabled',true);
            }
          }
        }else{
          this.fuZhuAdditionalList.forEach(item => {
            this.$set(item,'disabled',true);
          })
        }
        console.log(this.fuZhuAdditionalList)
        this.open = true;
        this.title = "账单详情";
      })
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
    /** 查询技师人员列表 */
    getArtificerListDat(){
      getArtificerList(this.queryParams).then(response => {
        this.artificerList = response.data;
      });
    },
  }
};
</script>
