<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="会员卡名称" prop="cardName">
        <el-input
          v-model="queryParams.cardName"
          placeholder="请输入会员卡名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['business:card:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['business:card:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>
    <el-table v-loading="loading" :data="cardList" @selection-change="handleSelectionChange">
      <el-table-column label="会员卡名称" align="center" prop="cardName" />
      <el-table-column label="会员卡类型" align="center" prop="cardType" >
          <template slot-scope="scope">
            <dict-tag :options="dict.type.b_card_type" :value="scope.row.cardType"/>
          </template>
      </el-table-column>
      <el-table-column label="充值金额" align="center" prop="cardAmount" />
      <el-table-column label="赠送金额" align="center" prop="cardGiveAmount" />
      <el-table-column label="单次金额" align="center" prop="singleAmount" />
      <el-table-column label="赠送次数" align="center" prop="cardTimes" />
      <el-table-column label="会员卡标识" align="center" prop="dataType" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="small"
            type="primary"
            round
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['business:card:edit']"
          >修改</el-button>
          <el-button
            size="small"
            type="danger"
            round
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['business:card:remove']"
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

    <!-- 添加或修改业务--会员卡信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="95px">
        <el-row>
            <el-col :span="24">
              <el-form-item label="会员卡名称" prop="cardName">
                  <el-input v-model="form.cardName" placeholder="请输入会员卡名称" />
              </el-form-item>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="24">
                <el-form-item label="会员卡类型" prop="cardType">
                  <el-select v-model="form.cardType" placeholder="请选择会员卡类型">
                    <el-option
                      v-for="dict in dict.type.b_card_type"
                      :key="dict.value"
                      :label="dict.label"
                      :value="dict.value"
                    ></el-option>
                  </el-select>
                </el-form-item>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="24">
                <el-form-item label="充值金额" prop="cardAmount">
                  <el-input v-model="form.cardAmount" placeholder="请输入会员卡金额" />
                </el-form-item>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="24">
                <el-form-item label="赠送金额" prop="cardGiveAmount">
                  <el-input v-model="form.cardGiveAmount" placeholder="请输入会员卡赠送金额" />
                </el-form-item>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="24">
                <el-form-item label="单次金额" prop="singleAmount">
                  <el-input v-model="form.singleAmount" placeholder="请输入单次金额" />
                  <i class="el-icon-warning" style="color:#F56C6C;font-size:12px">只有选择会员卡类型为赠送金额卡时填写，选择其它类型请输入数字0</i>
                </el-form-item>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="24">
                <el-form-item label="赠送次数" prop="cardTimes">
                  <el-input v-model="form.cardTimes" placeholder="请输入会员赠送次数卡赠送的次数" />
                  <i class="el-icon-warning" style="color:#F56C6C;font-size:12px">只有选择会员卡类型为赠送次数卡时填写，选择其它类型请输入数字0</i>
                </el-form-item>
            </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listCard, getCard, delCard, addCard, updateCard } from "@/api/business/card";
export default {
  name: "Card",
  dicts: ['b_card_type'],
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
      // 业务--会员卡信息表格数据
      cardList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        cardName: null,
        cardType: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        cardName: [
          { required: true, message: "会员卡名称不能为空", trigger: "blur" }
        ],
        cardType: [
          { required: true, message: "会员卡类型不能为空", trigger: "blur" }
        ],
        cardAmount: [
          { required: true, message: "充值金额不能为空", trigger: "blur" },
          {
            pattern: /^\d+(\.\d{0,2})?$/,
            message: "只能输入数字或者两位小数",
            trigger: "blur"
          }
        ],
        cardGiveAmount: [
          { required: true, message: "赠送金额不能为空", trigger: "blur" },
          {
            pattern: /^\d+(\.\d{0,2})?$/,
            message: "只能输入数字或者两位小数",
            trigger: "blur"
          }
        ],
        singleAmount: [
          { required: true, message: "单次金额不能为空", trigger: "blur" },
          {
            pattern: /^\d+(\.\d{0,2})?$/,
            message: "只能输入数字或者两位小数",
            trigger: "blur"
          }
        ],
        cardTimes: [
          { required: true, message: "赠送次数不能为空", trigger: "blur" },
          {
            pattern: /^\d+(\.\d{0,2})?$/,
            message: "只能输入数字",
            trigger: "blur"
          }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询业务--会员卡信息列表 */
    getList() {
      this.loading = true;
      listCard(this.queryParams).then(response => {
        this.cardList = response.rows;
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
        cardId: null,
        cardName: null,
        cardType: null,
        cardAmount: null,
        cardGiveAmount: null,
        dataType: null,
        createName: null,
        createTime: null,
        modifyName: null,
        modifyTime: null
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
      this.ids = selection.map(item => item.cardId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加会员卡信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const cardId = row.cardId || this.ids
      getCard(cardId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改会员卡信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.cardId != null) {
            updateCard(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCard(this.form).then(response => {
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
      const cardIds = row.cardId || this.ids;
      this.$modal.confirm('是否确认删除会员卡信息编号为"' + row.cardName + '"的数据项？').then(function() {
        return delCard(cardIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('business/card/export', {
        ...this.queryParams
      }, `card_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
