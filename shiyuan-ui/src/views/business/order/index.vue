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
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handlePayment"
          v-hasPermi="['business:order:payment']"
        >结账</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['business:order:export']"
        >导出</el-button>
      </el-col>
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
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['business:order:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
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
    <!-- 结账对话框对话框 -->
    <el-dialog :title="jieZhangTitle" :visible.sync="jieZhangOpen" width="1000px" append-to-body>
      <el-form ref="form" :model="jieZhangForm" :rules="jieZhangRules" label-width="90px">
        <div  v-for="orderInfo in selectOrderList" :key="orderInfo.orderId">
          <el-row>
            <el-col :span="12">
              <el-form-item label="开单技师" prop="artificerId">
                <el-select v-model="orderInfo.artificerName" placeholder="请选择技师名称"
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
                <el-select v-model="orderInfo.additionalId" placeholder="请选择服务项目"
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
              <el-form-item label="开始时间" prop="startTime">
                zhang
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="辅助项目" prop="additionalId">
                <el-checkbox-group v-model="additionalIds">
                  <el-checkbox name="type" v-for="(itemObj,index) in fuZhuAdditionalList" :key="index" :label="itemObj.additionalId">
                    {{itemObj.additionalName}}
                  </el-checkbox>
                </el-checkbox-group>
              </el-form-item>
            </el-col>
          </el-row>
          <el-divider />
        </div>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitJieZhangForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listOrder, getOrder, delOrder, addOrder, updateOrder } from "@/api/business/order";
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
      // 选中的数组对象
      selectOrderList: [],
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
      // 结账弹窗层
      jieZhangTitle: "",
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
      //主服务项目列表
      zhuAdditionalList: [],
      // 辅助项目列表
      fuZhuAdditionalList: [],
      // 技师列表
      artificerList: [],
      // 表单参数
      form: {},
      // 结账弹出层
      jieZhangOpen: false,
      // 结账表单参数
      jieZhangForm: {
        artificerId: null,
        additionalIds:[],
      },
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
      // 结账表单校验
      jieZhangRules: {

      },
      // 定义结账弹窗选择辅助项目的复选框选中数组
      additionalIds:[],
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
      this.selectOrderList = selection;
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加订单信息";
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
      let obj = this.additionalList.find(item => item.additionalId === val);
      // 判断的时候可以直接写obj而不需要以判断对象是否为空的方式是因为：如果找不到，find方法返回的是undefined而不是空对象
      if(obj) {
          this.form.additionalName= obj.additionalName;
          if(this.form.startTime){
            const entTime = this.$moment(this.form.startTime).add(obj.duration,'minutes').format("YYYY-MM-DD HH:mm");// 通过this.$moment() 计算日期的加减和格式化
            this.form.endTime = entTime ;
            this.form.orderAmount = obj.additionalAmount;
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
    /** 结账按钮操作 */
    handlePayment(){
      if(this.ids.length>0){
        /*// 加载主服务项目列表
        this.getZhuAdditionalList();
        // 加载附加项项目列表
        this.getFuZhuAdditionalList();
        // 加载技师列表数据
        this.getArtificerListDat();
        this.jieZhangTitle="结账弹窗";
        this.jieZhangOpen= true;*/
        this.$router.push({ path: '/business/order-jieZhang/index', query: {orderDataList:this.selectOrderList  } })
      }else{
        this.$modal.msgError("请选择账单");
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
    /** 导出按钮操作 */
    handleExport() {
      this.download('business/order/export', {
        ...this.queryParams
      }, `order_${new Date().getTime()}.xlsx`)
    },
    /** 确认结账按钮操作 */
    submitJieZhangForm(){

    }
  }
};
</script>
