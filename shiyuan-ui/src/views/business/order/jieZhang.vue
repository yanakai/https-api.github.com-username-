<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
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
    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
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
      <el-table-column label="辅助项目" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
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


  </div>
</template>

<script>
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
      //服务项目列表
      additionalList: [],
      // 技师列表
      artificerList: [],
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
    };
  },
  created() {
    this.orderList = this.$route.query.orderDataList;
    this.loading = false;
  },
  methods: {
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
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

    /** 查询服务项目列表 */
    getAdditionalList(){
        const params = {};
        additionalList(params).then(response => {
          this.additionalList = response.data;
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
        this.jieZhangOpen= true;
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
  }
};
</script>
