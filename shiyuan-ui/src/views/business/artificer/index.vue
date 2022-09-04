<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="技师名称" prop="artificerFullName">
        <el-input
          v-model="queryParams.artificerFullName"
          placeholder="请输入技师名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="技师等级" prop="artificerLevel">
        <el-select v-model="queryParams.artificerLevel" placeholder="请选择等级" clearable>
          <el-option
            v-for="dict in dict.type.b_artificer_level"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="是否排钟" prop="isBell">
        <el-select v-model="queryParams.isBell" placeholder="请选择排钟" clearable>
              <el-option
                v-for="dict in dict.type.sys_yes_no"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              ></el-option>
          </el-select>
      </el-form-item>
      <el-form-item label="手机号" prop="phoneNumber">
        <el-input
          v-model="queryParams.phoneNumber"
          placeholder="请输入手机号"
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
          v-hasPermi="['business:artificer:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['business:artificer:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="artificerList" @selection-change="handleSelectionChange">
      <el-table-column label="所属门店" align="center" prop="deptName" />
      <el-table-column label="技师名称" align="center" prop="artificerFullName" :show-overflow-tooltip="true"/>
      <el-table-column label="技师简称" align="center" prop="artificerName"  :show-overflow-tooltip="true"/>
      <el-table-column label="技师等级" align="center" prop="artificerLevel" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.b_artificer_level" :value="scope.row.artificerLevel"/>
        </template>
      </el-table-column>
      <el-table-column label="手机号" align="center" prop="phoneNumber" />
      <el-table-column label="性别" align="center" prop="sex" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.sex"/>
        </template>
      </el-table-column>
      <el-table-column label="底薪" align="center" prop="salary" />
      <el-table-column label="入职时间" align="center" prop="entryTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.entryTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="是否排钟" align="center" prop="isBell" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_yes_no" :value="scope.row.isBell"/>
        </template>
      </el-table-column>
      <el-table-column label="特长" align="center" prop="speciality" :show-overflow-tooltip="true" />
      <el-table-column label="备注" align="center" prop="remark" :show-overflow-tooltip="true"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" :min-width=150>
        <template slot-scope="scope">
          <el-button
            size="small"
            type="primary"
            round
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['business:artificer:edit']"
          >修改</el-button>
          <el-button
            size="small"
            type="danger"
            round
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['business:artificer:remove']"
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

    <!-- 添加或修改业务--技师对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="900px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="24">
            <el-form-item label="所属门店" prop="deptId">
                <treeselect v-model="form.deptId" :options="deptOptions" :show-count="true" placeholder="请选择归属门店" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="技师名称" prop="artificerFullName">
              <el-input v-model="form.artificerFullName" placeholder="请输入技师名称" maxlength="30" />
            </el-form-item>
          </el-col>
          <el-col :span="12">  
            <el-form-item label="技师简称" prop="artificerName">
              <el-input v-model="form.artificerName" placeholder="请输入技师简称" maxlength="30" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="性别" prop="artificerLevel">
              <el-select v-model="form.sex" placeholder="请选择性别">
                <el-option
                  v-for="dict in dict.type.sys_user_sex"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="手机号" prop="phoneNumber">
              <el-input v-model="form.phoneNumber" placeholder="请输入手机号" maxlength="11" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="技师等级" prop="artificerLevel">
              <el-select v-model="form.artificerLevel" placeholder="请选择等级">
                <el-option
                  v-for="dict in dict.type.b_artificer_level"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="底薪" prop="salary">
              <el-input v-model="form.salary" placeholder="请输入底薪" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="入职时间" prop="entryTime">
              <el-date-picker clearable
                v-model="form.entryTime"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="请选择入职时间">
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="是否排钟" prop="isBell">
              <el-select v-model="form.isBell" placeholder="请选择排钟">
                  <el-option
                    v-for="dict in dict.type.sys_yes_no"
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
            <el-form-item label="特长" prop="speciality">
              <el-input v-model="form.speciality" type="textarea" placeholder="请输入特长" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" type="textarea" placeholder="请输入备注" />
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
import { listArtificer, getArtificer, delArtificer, addArtificer, updateArtificer } from "@/api/business/artificer";
import { deptTreeSelect } from "@/api/system/user";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
export default {
  name: "Artificer",
  dicts: ['sys_user_sex','sys_yes_no','b_artificer_level'],
  components: { Treeselect },
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
      // 业务--技师表格数据
      artificerList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 部门树选项
      deptOptions: undefined,
      // 部门名称
      deptName: undefined,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        deptId: null,
        artificerFullName: null,
        artificerName: null,
        artificerLevel: null,
        phoneNumber: null,
        sex: null,
        entryTime: null,
        isBell: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        artificerFullName: [
          { required: true, message: "技师名称不能为空", trigger: "blur" },
          { min: 2, max: 20, message: '技师名称长度必须介于 2 和 20 之间', trigger: 'blur' }
        ],
        artificerName: [
          { required: true, message: "技师简称不能为空", trigger: "blur" },
          { min: 2, max: 20, message: '技师简称长度必须介于 2 和 20 之间', trigger: 'blur' }
        ],
        phoneNumber: [
          { required: true, message: "手机号不能为空", trigger: "blur" },
          {
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: "blur"
          }
        ],
        entryTime: [
          { required: true, message: "入职时间不能为空", trigger: "blur" }
        ],
        isBell: [
          { required: true, message: "是否排钟不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getDeptTree();
  },
  methods: {
    /** 查询部门下拉树结构 */
    getDeptTree() {
      deptTreeSelect().then(response => {
        this.deptOptions = response.data;
      });
    },
    /** 查询业务--技师列表 */
    getList() {
      this.loading = true;
      listArtificer(this.queryParams).then(response => {
        this.artificerList = response.rows;
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
        deptId: null,
        artificerFullName: null,
        artificerName: null,
        artificerLevel: null,
        phoneNumber: null,
        sex: null,
        salary: null,
        entryTime: null,
        speciality: null,
        isBell: null,
        remark: null,
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
      this.ids = selection.map(item => item.artificerId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.getDeptTree();
      this.open = true;
      this.title = "添加技师人员信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.getDeptTree();
      const artificerId = row.artificerId || this.ids
      getArtificer(artificerId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改技师人员信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.artificerId != null) {
            updateArtificer(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addArtificer(this.form).then(response => {
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
      const artificerIds = row.artificerId || this.ids;
      this.$modal.confirm('是否确认删除技师编号为"' + artificerIds + '"的数据项？').then(function() {
        return delArtificer(artificerIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('business/artificer/export', {
        ...this.queryParams
      }, `artificer_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
