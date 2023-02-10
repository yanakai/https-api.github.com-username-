<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单状态" prop="orderState">
        <el-select v-model="queryParams.orderState" placeholder="请选择订单状态" clearable>
          <el-option
            v-for="dict in dict.type.b_order_state"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
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
        <el-select v-model="queryParams.additionalId" placeholder="请选择服务项目id" clearable>
          <el-option
            v-for="dict in dict.type.b_additional_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="技师名称" prop="artificerName">
        <el-select v-model="queryParams.artificerName" placeholder="请选择技师名称" clearable>
          <el-option
            v-for="dict in dict.type.b_additional_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['business:order:add']"
        >新增</el-button>
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handlePayment"
          v-hasPermi="['business:order:payment']"
        >结账</el-button>
      </el-col> -->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
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
              v-if="scope.row.orderState === '0'"
              size="small"
              type="primary"
              round
              icon="el-icon-plus"
              @click="handlePayment(scope.row)"
              v-hasPermi="['business:order:payment']"
            >结账
          </el-button>
          <el-button
            size="small"
            type="primary"
            round
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['business:order:edit']"
          >修改</el-button>
          <el-button
            size="small"
            type="danger"
            round
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['business:order:remove']"
          >删除</el-button>
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

    <!-- 添加或修改订单信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="750px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="90px">
         <el-row>
            <el-col :span="12">
              <el-form-item label="开始时间" prop="startTime">
                <el-date-picker
                  v-model="form.startTime"
                  type="datetime"
                  value-format="yyyy-MM-dd HH:mm"
                  placeholder="请选择开始时间">
                </el-date-picker>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="服务项目" prop="additionalId">
                <el-select v-model="form.additionalId" placeholder="请选择服务项目"
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
                  v-model="form.endTime"
                  type="datetime"
                  value-format="yyyy-MM-dd HH:mm"
                  placeholder="请选择结束时间">
                </el-date-picker>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="排钟类型" prop="bellType">
                <el-select v-model="form.bellType" placeholder="请选择排钟类型">
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
        <el-row>
            <el-col :span="12">
              <el-form-item label="开单技师" prop="artificerId">
                <el-select v-model="form.artificerId" placeholder="请选择技师名称"
                  @change="selectArtificerName($event)"
                  >
                  <el-option
                    v-for="item in artificerList"
                    :key="item.artificerId"
                    :label="item.artificerName"
                    :value="item.artificerId"
                  ></el-option>
                </el-select>
              </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <!-- 结账对话框 -->
    <el-dialog :title="jieZhangTitle" :visible.sync="jieZhangOpen" width="1000px" append-to-body>
      <el-form ref="jieZhangForm" :model="jieZhangForm" :rules="jieZhangRules" label-width="90px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="开单技师" prop="artificerId">
              <el-select v-model="jieZhangForm.artificerName" placeholder="请选择技师名称"
                @change="selectArtificerName($event)"
                >
                <el-option
                  v-for="item in artificerList"
                  :key="item.artificerId"
                  :label="item.artificerName"
                  :value="item.artificerId"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="服务项目" prop="additionalId">
              <el-select v-model="jieZhangForm.additionalId" placeholder="请选择服务项目"
                @change="selectZhuAdditional($event)"
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
          <el-col :span="24">
            <el-form-item label="辅助项目" prop="additionalId">
              <el-checkbox-group v-model="additionalIds"  >
                <el-checkbox
                  v-for="item in fuZhuAdditionalList"
                  :key="item.additionalId"
                  :value="item.additionalId"
                  :label="item.additionalId"
                  @change="e => changeFuZhuAdditionalLisgt(e,item)"
                >
                {{item.additionalName}}
                </el-checkbox>
              </el-checkbox-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-divider />
        <el-row>
          <el-col :span="24">
            <el-form-item label="会员搜索">
              <el-autocomplete style="width:100%"
                v-model="memberName"
                :fetch-suggestions="memberSearchAsync"
                @select="handleMemberSelect"
                placeholder="请输入会员姓名、手机号"
                @change="handleMemberChange"
                >
                <template slot-scope="{item}">
                  <div class="autocomplete-choose-name" v-html="htmlValue(item)"></div>
                </template>
              </el-autocomplete>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="memberInfoDataView">
          <el-col :span="24">
            <el-form-item label="会员信息">
              <el-button size="medium" type="primary">{{memberInfoData}}</el-button>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="8">
            <el-form-item label="结账时间" prop="endTime">
              <el-date-picker
                v-model="jieZhangForm.endTime"
                type="datetime"
                value-format="yyyy-MM-dd HH:mm"
                placeholder="请选择结束时间">
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="结账方式" prop="paymentType">
              <el-select v-model="jieZhangForm.paymentType"  placeholder="请选择支付方式" 
               @change="selectPaymentTypeChange($event)"
                >
                <el-option
                  v-for="dict in dict.type.b_order_payment_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="结账金额" prop="orderAmount">
              <el-input v-model="jieZhangForm.orderAmount" placeholder="请输入会员卡金额" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="8">
            <el-form-item label="剩余金额" prop="cardSurplusAmount">
              <el-input v-model="jieZhangForm.cardSurplusAmount" :disabled="true" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="剩余次数" prop="cardSurplusNum">
              <el-input v-model="jieZhangForm.cardSurplusNum" :disabled="true"/>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="消费次数" prop="orderTimes">
              <el-input v-model="jieZhangForm.orderTimes" :disabled="true"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="密码" prop="memberJieZhangPassword">
              <!-- <el-input v-model="jieZhangForm.memberJieZhangPassword" type="password"  show-password /> -->
              <el-input v-model="jieZhangForm.memberJieZhangPassword" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitJieZhangForm">确认结账</el-button>
        <el-button @click="cancelJieZhangForm">取消结账</el-button>
        <el-button type="primary" @click="submitWuMiMaJieZhangForm">无密码结账</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listOrder, getOrder, delOrder, addOrder, updateOrder,savePaymentData } from "@/api/business/order";
import { additionalList } from "@/api/business/additional";
import { getArtificerList} from "@/api/business/artificer";
import {memberList} from "@/api/business/member";


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
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderState: null,
        bellType: null,
        additionalId: null,
        artificerId: null,
        artificerName: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        startTime: [
          { required: true, message: "开始时间不能为空", trigger: "blur" }
        ],
        additionalId: [
          { required: true, message: "服务项目不能为空", trigger: "blur" }
        ],
        endTime: [
          { required: true, message: "结束时间不能为空", trigger: "blur" }
        ],
        bellType: [
          { required: true, message: "排钟类型不能为空", trigger: "blur" }
        ],
        artificerId: [
          { required: true, message: "开单技师不能为空", trigger: "blur" }
        ],
      },
      // 结账弹窗层
      jieZhangTitle: "",
      //主服务项目列表
      zhuAdditionalList: [],
      // 辅助项目列表
      fuZhuAdditionalList: [],
      // 技师列表
      artificerList: [],
      // 结账弹出层
      jieZhangOpen: false,
      // 定义结账弹窗选择辅助项目的复选框选中数组
      additionalIds:[],
      //选择的辅助项目金额
      fuZhuAdditionalAmount:0,
      //选择的主服务项目金额
      zhuAdditionalAmount:0,
      // 会员密码校验
      confirmPassword:null,
      // 结账表单参数
      jieZhangForm: {
        orderId:null,
        memberId: null,
        artificerId: null,
        endTime:null,
        paymentType:null,
        orderAmount:null,
        // 充值会员剩余金额
        cardSurplusAmount:0,
        // 次数会员剩余次数
        cardSurplusNum:0,
        // 结账密码
        memberJieZhangPassword:null,
        // 消费次数
        orderTimes:0,
      },
      // 会员搜索回显
      memberName:"",
      // 选中会员信息
      memberInfoData: null,
      // 是否显示会员信息
      memberInfoDataView: false,
      // 结账表单校验
      jieZhangRules: {
        paymentType: [
          { required: true, message: "结账方式不能为空", trigger: "blur" }
        ],
        // memberJieZhangPassword: [
        //   { required: true, message: "结账密码不能为空", trigger: "blur" }
        // ],
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询订单信息列表 */
    getList() {
      this.loading = true;
      listOrder(this.queryParams).then(response => {
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
      this.form = {
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
        createBy: null
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
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加订单信息";
      // 加载开单时间
      this.form.startTime = this.parseTime(new Date(),"{y}-{m}-{d} {h}:{i}");
      // 加载主服务项目列表
      this.getZhuAdditionalList();
      // 加载技师列表数据
      this.getArtificerListDat();
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const orderId = row.orderId || this.ids
      getOrder(orderId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改订单信息";
      });
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
        this.form.additionalName= obj.additionalName;
        // 赋值订单金额
        this.form.orderAmount = obj.additionalAmount
        if(this.form.startTime){
          const entTime = this.$moment(this.form.startTime).add(obj.duration,'minutes').format("YYYY-MM-DD HH:mm");// 通过this.$moment() 计算日期的加减和格式化
          this.form.endTime = entTime ;
        }else{
          this.form.additionalId=null;
          this.form.additionalName=null;
          this.$modal.alertWarning("请先选择开始时间");
        }
      }
    },
    /** 查询技术人员列表 */
    getArtificerListDat(){
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
        this.form.artificerName= obj.artificerFullName;
      }
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.orderId != null) {
            updateOrder(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOrder(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const orderIds = row.orderId || this.ids;
      this.$modal.confirm('是否确认删除订单信息编号为"' + orderIds + '"的数据项？').then(function() {
        return delOrder(orderIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 结账按钮操作 */
    handlePayment(row){
      // 重置结账表单
        this.resetJieZhangForm();
        // 赋值订单信息
        this.jieZhangForm = row;
        // 赋值主服务项目金额
        this.zhuAdditionalAmount = this.jieZhangForm.orderAmount;
        // 加载附加项项目列表
        this.getFuZhuAdditionalList();
        // 加载主服务项目列表
        this.getZhuAdditionalList();
        // 加载技师列表数据
        this.getArtificerListDat();
        // 加载结账时间
        this.jieZhangForm.endTime = this.parseTime(new Date(),"{y}-{m}-{d} {h}:{i}");
        this.jieZhangTitle="结账弹窗";
        this.jieZhangOpen= true;
       // this.$router.push({ path: '/business/order-jieZhang/index', query: {orderDataList:this.selectOrderList  } })
    },
    // 重置结账表单
    resetJieZhangForm() {
      this.additionalIds = [];
      this.memberName= "";
      this.memberInfoDataView = false;
      this.jieZhangForm = {
        orderId:null,
        memberId: null,
        artificerId: null,
        endTime:null,
        paymentType:null,
        orderAmount:null,
        // 充值会员剩余金额
        cardSurplusAmount:0,
        // 次数会员剩余次数
        cardSurplusNum:0,
        // 结账密码
        memberPassword:null,
        // 消费次数
        orderTimes:0,
      };
      this.resetForm("jieZhangForm");
    },
     /**监听主服务项目下拉  计算结账金额 */
    selectZhuAdditional(val){//这个val也就是value值
      let obj = this.zhuAdditionalList.find(item => item.additionalId === val);
      // 判断的时候可以直接写obj而不需要以判断对象是否为空的方式是因为：如果找不到，find方法返回的是undefined而不是空对象
      if(obj) {
          this.jieZhangForm.orderAmount = this.fuZhuAdditionalAmount + obj.additionalAmount;
      }
    },
    // 选择辅助项目复选款事件 计算结账金额
    changeFuZhuAdditionalLisgt(e,item){
      if(e) {
        for(let id of this.additionalIds){
          if(item.additionalId == id){
            this.fuZhuAdditionalAmount += item.additionalAmount;
          }
        }
      } else {
        this.fuZhuAdditionalAmount  -= item.additionalAmount;
      }
      // 结账金额 = 主服务项目 + 辅助项目
      this.jieZhangForm.orderAmount = this.fuZhuAdditionalAmount + this.zhuAdditionalAmount;
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
      let key = this.memberName;
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
      // 选中会员密码赋值
      this.confirmPassword = item.memberPassword;
      // 选中会员id赋值
      this.jieZhangForm.memberId = item.memberId;
      // 选中会员的名称赋值
      this.memberName = item.memberName;
      // 回显选中的会员信息
      this.memberInfoData = item.memberName +" "+ item.memberPhonenumper +" "+item.memberCardName +" "+ item.surplusAmount ;
      if(item.remark){
        this.memberInfoData = item.memberName +" "+ item.memberPhonenumper +" "+item.memberCardName +" "+ item.surplusAmount + " 备注："+ item.remark;
      }
      // 回显结账方式自动赋值到会员
      this.jieZhangForm.paymentType = '1';
      // 判断当前选中的会员类型 1:赠送金额卡；2:赠送次数卡
      if(item.memberType == 1){
        if(item.surplusAmount < this.jieZhangForm.orderAmount){
          this.$modal.alertWarning("当前会员不足以支付本次订单！！！");
          // 当会员剩余金额不够本次支付时，该订单金额= 该会员剩余金额 ，未支付金额重新创建订单支付
          this.jieZhangForm.orderAmount = item.surplusAmount;
          // 会员剩余金额设置为0；
          this.jieZhangForm.cardSurplusAmount = 0;
        }else{
          // 赠送金额卡会员 计算剩余金额
          if(item.singleAmount < this.zhuAdditionalAmount){
            this.$modal.alertWarning("当前会员为老会员，使用老卡的支付方式");
          }
          // 会员结账金额 = 辅助项目金额 + 该会员的单次金额
          this.jieZhangForm.orderAmount = this.fuZhuAdditionalAmount + item.singleAmount ;
          // 会员剩余金额 = 会员剩余金额
          this.jieZhangForm.cardSurplusAmount = item.surplusAmount;
          // 赠送金额卡会员 剩余次数为0
          this.jieZhangForm.cardSurplusNum = 0;
          // 赠送金额卡会员 当前消费次数为0
          this.jieZhangForm.orderTimes = 0;
        }
      }else {
        // 赠送次数会员 结账金额为 0  辅助项目不能选取
        this.jieZhangForm.orderAmount = 0;
        // 赠送次数会员 剩余金额为0
        this.jieZhangForm.cardSurplusAmount = 0;
        // 赠送次数卡 计算剩余次数
        if(item.surplusTimes > 0){
          // 选中会员的剩余次数 = 会员剩余次数
          this.jieZhangForm.cardSurplusNum = item.surplusTimes;
          // 当前消费次数
          this.jieZhangForm.orderTimes = 1;
        }else{
          this.$modal.alertWarning("该会员赠送次数已经用完！");
        }
      }
    },
    handleMemberChange(){
      if(this.memberName==null || this.memberName == ''){
        // 隐藏会员信息
        this.memberInfoDataView = false;
        this.memberId = null ;
        // 赠送金额卡会员 剩余次数为0
        this.jieZhangForm.cardSurplusNum = 0;
        // 赠送金额卡会员 当前消费次数为0
        this.jieZhangForm.orderTimes = 0;
        // 赠送次数会员 剩余金额为0
        this.jieZhangForm.cardSurplusAmount = 0;
        // 清空结账方式
        this.jieZhangForm.paymentType=null;
        this.jieZhangForm.paymentType=null;
        // 重置结账金额 账单金额 = 主服务项目金额 + 辅助项目金额
        this.jieZhangForm.orderAmount = this.zhuAdditionalAmount + this.fuZhuAdditionalAmount;
      }
    },
    /**监听结账方式下拉 */
    selectPaymentTypeChange(val){//这个val也就是value值
      if(val == '1'){ // 当选择的结账方式是会员时 判断是否已选会员
        if(this.memberName ==null || this.memberName ==""){
          this.jieZhangForm.paymentType=null;
          this.jieZhangForm.paymentType=null;
          this.$modal.alertWarning("请选择会员信息");
        }
      }
    },
    // 结账弹窗取消按钮
    cancelJieZhangForm() {
      this.jieZhangOpen= false;
      this.resetJieZhangForm();
    },
    /** 确认结账按钮操作 */
    submitJieZhangForm(){
      if(this.jieZhangForm.memberJieZhangPassword){
        this.$refs["jieZhangForm"].validate(valid => {
          if (valid) {
            if(this.jieZhangForm.memberJieZhangPassword){
              if(this.jieZhangForm.memberJieZhangPassword != this.confirmPassword){
                this.$modal.alertWarning("会员密码错误");
                return ;
              }
            }
            // 赋值选中的辅助项目
            this.jieZhangForm.additionalIds = this.additionalIds;
            savePaymentData(this.jieZhangForm).then(response => {
              this.$modal.msgSuccess("结账成功");
              this.jieZhangOpen = false;
              this.getList();
            });
          }
        })
      }else{
        this.$modal.alertWarning("结账密码不能为空");
        return ;
      }
      
    },
    // 无密码结账
    submitWuMiMaJieZhangForm(){
      this.$refs["jieZhangForm"].validate(valid => {
        if (valid) {
          // 赋值选中的辅助项目
          this.jieZhangForm.additionalIds = this.additionalIds;
          savePaymentData(this.jieZhangForm).then(response => {
            this.$modal.msgSuccess("结账成功");
            this.jieZhangOpen = false;
            this.getList();
          });
        }
      })
    },
  }
};
</script>
