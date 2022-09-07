<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="auto">
      <el-form-item label="会员姓名" prop="memberName">
        <el-input
          v-model="queryParams.memberName"
          placeholder="请输入会员姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="手机号" prop="memberPhonenumper">
        <el-input
          v-model="queryParams.memberPhonenumper"
          placeholder="请输入手机号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="会员卡名称" prop="memberCard">
        <el-input
          v-model="queryParams.memberCard"
          placeholder="请输入会员卡名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="办卡技师" prop="artificerId">
        <el-select v-model="queryParams.artificerId" placeholder="请选择办卡技师" clearable>
          <el-option
            v-for="item in artificerList"
            :key="item.artificerId"
            :label="item.artificerFullName"
            :value="item.artificerId"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="办卡人员" prop="cardPersonnel">
        <el-input
          v-model="queryParams.cardPersonnel"
          placeholder="请输入办卡人员"
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
          v-hasPermi="['business:member:add']"
        >新增会员卡</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['business:member:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="memberList" @selection-change="handleSelectionChange" stripe >
      <el-table-column label="会员姓名" align="center" prop="memberName" />
      <el-table-column label="手机号" align="center" prop="memberPhonenumper" :min-width=150 />
      <el-table-column label="性别" align="center" prop="sex" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.sex"/>
        </template>
      </el-table-column>
      <el-table-column label="办卡时间" align="center" prop="createTime" :min-width=150 >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="会员卡名称" align="center" prop="memberCardName" :min-width=150 />
      <el-table-column label="会员卡类型" align="center" prop="memberType" :min-width=150 >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.b_card_type" :value="scope.row.memberType"/>
        </template>
      </el-table-column>
      <el-table-column label="充值金额" align="center" prop="rechargeAmount" />
      <el-table-column label="赠送金额" align="center" prop="giveAmount" />
      <el-table-column label="单次金额" align="center" prop="singleAmount" />
      <el-table-column label="剩余金额" align="center" prop="surplusAmount" />
      <el-table-column label="剩余次数" align="center" prop="surplusTimes" />
      <el-table-column label="办卡次数" align="center" prop="handleCardNum" />
      <el-table-column label="支付方式" align="center" prop="paymentType" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.b_member_payment" :value="scope.row.paymentType"/>
        </template>
      </el-table-column>
      <el-table-column label="办卡技师" align="center" prop="artificerName" :min-width=120 />
      <el-table-column label="会员积分" align="center" prop="memberPoints" />
      <el-table-column label="赠品" align="center" prop="additive" :show-overflow-tooltip="true" />
      <el-table-column label="赠送数量" align="center" prop="additiveNumber" />
      <el-table-column label="办卡人员" align="center" prop="cardPersonnel" />
      <el-table-column label="备注" align="center" prop="remark" :show-overflow-tooltip="true" />
      <el-table-column label="操作" fixed="right" align="center" class-name="small-padding fixed-width" :min-width=650 >
        <template slot-scope="scope">
          <el-button
            size="small"
            type="success"
            round
            icon="el-icon-view"
            @click="handleDetails(scope.row)"
            v-hasPermi="['business:member:details']"
          >详情</el-button>
          <el-button
            size="small"
            type="primary"
            round
            icon="el-icon-plus"
            @click="handleAddMember(scope.row)"
            v-hasPermi="['business:member:add']"
          >续卡</el-button>
          <el-button
            size="small"
            type="primary"
            round
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['business:member:edit']"
          >修改</el-button>
          <el-button
            size="small"
            type="primary"
            round
            icon="el-icon-key"
            @click="handleUpdatePwd(scope.row)"
            v-hasPermi="['business:member:updatePwd']"
          >修改密码</el-button>
          <el-button
            size="small"
            type="primary"
            round
            icon="el-icon-s-fold"
            @click="handleMerge(scope.row)"
            v-hasPermi="['business:member:merge']"
          >合并</el-button>
          <el-button
            size="small"
            type="info"
            round
            icon="el-icon-s-grid"
            @click="handleConsumptionRecord(scope.row)"
            v-hasPermi="['business:member:consumptionRecord']"
          >消费记录</el-button>
          <el-button
            size="small"
            type="danger"
            round
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['business:member:remove']"
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

    <!-- 添加或修改会员信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="950px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="auto">
        <el-row>
            <el-col :span="8">
                <el-form-item label="会员姓名" prop="memberName">
                    <el-input v-model="form.memberName" placeholder="请输入会员姓名" :disabled="disabledView"/>
                </el-form-item>
            </el-col>
            <el-col :span="8">   
                <el-form-item label="手机号" prop="memberPhonenumper">
                    <el-input v-model="form.memberPhonenumper" placeholder="请输入手机号" :disabled="disabledView" />
                </el-form-item>
            </el-col>
            <el-col :span="8">   
                <el-form-item label="性别" prop="sex">
                    <el-select v-model="form.sex" placeholder="请选择会员性别" :disabled="disabledView">
                      <el-option
                        v-for="dict in dict.type.sys_user_sex"
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
                <el-form-item label="会员卡名称" prop="memberCardId" >
                    <el-select v-model="form.memberCardId" filterable  placeholder="请选择会员卡" :disabled="editDisabledView">
                      <el-option
                        v-for="item in memberCardList"
                        :key="item.cardId"
                        :label="item.cardName"
                        :value="item.cardId"
                        @click.native="selectMemberCardInfo(item)"
                      ></el-option>
                    </el-select>
                </el-form-item>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="6">
                <el-form-item label="会员卡类型" prop="memberType" >
                    <el-select v-model="form.memberType" filterable clearable placeholder="请选择会员卡类型" :disabled="true">
                      <el-option
                        v-for="dict in dict.type.b_card_type"
                        :key="dict.value"
                        :label="dict.label"
                        :value="dict.value"
                      ></el-option>
                    </el-select>
                </el-form-item>
            </el-col>
            <el-col :span="6"> 
                <el-form-item label="充值金额" prop="rechargeAmount">
                    <el-input v-model="form.rechargeAmount" :disabled="true" />
                </el-form-item>
            </el-col>
            <el-col :span="6">
                 <el-form-item label="赠送金额" prop="giveAmount">
                    <el-input v-model="form.giveAmount" :disabled="true" />
                 </el-form-item>
            </el-col>
            <el-col :span="6"> 
                <el-form-item label="单次金额 " prop="singleAmount">
                    <el-input v-model="form.singleAmount" :disabled="true"/>
                </el-form-item>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="12"> 
                <el-form-item label="剩余金额 " prop="surplusAmount">
                    <el-input v-model="form.surplusAmount" :disabled="true"/>
                    <i class="el-icon-warning" style="color:#F56C6C;font-size:12px">用于会员卡类型为赠送金额卡，其它类型默认数字0</i>
                </el-form-item>
            </el-col>
            <el-col :span="12"> 
                <el-form-item label="剩余次数 " prop="surplusTimes">
                    <el-input v-model="form.surplusTimes" :disabled="true"/>
                    <i class="el-icon-warning" style="color:#F56C6C;font-size:12px">用于会员卡类型为赠送次数卡，其它类型默认数字0</i>
                </el-form-item>
            </el-col>
        </el-row>
        <el-row  v-if="editMemberPasswordView">
            <el-col :span="12">
                <el-form-item label="密码" prop="memberPassword" >
                  <el-input v-model="form.memberPassword" type="password" placeholder="请输入密码" show-password />
                </el-form-item>
            </el-col>
            <el-col :span="12">
                <el-form-item label="确认密码" prop="confirmPassword">
                  <el-input v-model="form.confirmPassword" placeholder="请再次输入密码" show-password/>
                </el-form-item>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="12">
                 <el-form-item label="支付方式" prop="paymentType" >
                    <el-select v-model="form.paymentType" filterable clearable placeholder="请选择支付方式" :disabled="disabledView">
                      <el-option
                        v-for="dict in dict.type.b_member_payment"
                        :key="dict.value"
                        :label="dict.label"
                        :value="dict.value"
                      ></el-option>
                    </el-select>
                 </el-form-item>
            </el-col>
            <el-col :span="12"> 
                <el-form-item label="会员积分" prop="memberPoints">
                    <el-input v-model="form.memberPoints" placeholder="请输入会员积分" :disabled="disabledView"/>
                </el-form-item>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="12">
                <el-form-item label="办卡技师" prop="artificerId" >
                    <el-select v-model="form.artificerId" filterable clearable placeholder="请选择办卡技师"
                      @change="selectArtificerName($event)"
                      :disabled="disabledView"
                      >
                      <el-option
                        v-for="item in artificerList"
                        :key="item.artificerId"
                        :label="item.artificerFullName"
                        :value="item.artificerId"
                      ></el-option>
                    </el-select>
                </el-form-item>
            </el-col>
            <el-col :span="12"> 
                <el-form-item label="办卡人员" prop="cardPersonnel">
                    <el-input v-model="form.cardPersonnel" placeholder="请输入办卡人员" :disabled="disabledView" />
                </el-form-item>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="12">
                <el-form-item label="赠品" prop="additive">
                    <el-input v-model="form.additive" placeholder="请输入赠品" :disabled="disabledView" />
                </el-form-item>
            </el-col>
            <el-col :span="12"> 
                <el-form-item label="赠送数量" prop="additiveNumber">
                    <el-input v-model="form.additiveNumber" placeholder="请输入赠送数量" :disabled="disabledView" />
                </el-form-item>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="24">
                <el-form-item label="备注" prop="remark">
                    <el-input v-model="form.remark" type="textarea" placeholder="请输入备注" :disabled="disabledView" />
                </el-form-item>
            </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer" v-if="buttonView">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <!-- 会员修改密码弹窗 -->
    <el-dialog :title="title" :visible.sync="memberUpdatePasswordOpen" width="500px" append-to-body>
      <ResetPwd :memberInfo="memberInfo" @close-page-click="memberUpdatePasswordOpen = false" />
    </el-dialog>
    <!-- 会员合并弹窗 -->
    <el-dialog :title="title" :visible.sync="mergeMemberListOpen" width="1000px" append-to-body>
       <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleMergeMember"
          v-hasPermi="['business:member:add']"
        >合并</el-button>
      </el-col>
    </el-row>
      <el-table v-loading="mergeLoading" :data="mergeMemberList" @selection-change="handleSelectionChangeByMerge">
        <el-table-column type="selection" width="55" align="center" :selectable="selectable" />
        <el-table-column label="会员姓名" align="center" prop="memberName" />
        <el-table-column label="手机号" align="center" prop="memberPhonenumper" :min-width=150 />
        <el-table-column label="办卡时间" align="center" prop="createTime" :min-width=150 >
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="会员卡名称" align="center" prop="memberCardName" :min-width=150 />
        <el-table-column label="会员卡类型" align="center" prop="memberType" :min-width=150 >
          <template slot-scope="scope">
            <dict-tag :options="dict.type.b_card_type" :value="scope.row.memberType"/>
          </template>
        </el-table-column>
        <el-table-column label="充值金额" align="center" prop="rechargeAmount" />
        <el-table-column label="赠送金额" align="center" prop="giveAmount" />
        <el-table-column label="单次金额" align="center" prop="singleAmount" />
        <el-table-column label="剩余金额" align="center" prop="surplusAmount" />
        <el-table-column label="剩余次数" align="center" prop="surplusTimes" />
      </el-table>
    </el-dialog>
  </div>
</template>

<script>
import { listMember, getMember, delMember, addMember, updateMember ,getMergeMemberList,handleMergeMemberList} from "@/api/business/member";
import { getCardList } from "@/api/business/card";
import { getArtificerList} from "@/api/business/artificer";
import { ResetPwd } from "@/components/memberResetPwd";
export default {
  name: "Member",
  dicts: ['sys_user_sex','b_member_payment','b_card_type'],
  component: {ResetPwd},
  data() {
    // 校验两次输入的密码是否一致
    const equalToPassword = (rule, value, callback) => {
      if (this.form.memberPassword !== value) {
        callback(new Error("两次输入的密码不一致"));
      } else {
        callback();
      }
    };
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
      // 会员信息表格数据
      memberList: [],
      // 会员卡列表
      memberCardList: [],
      // 技师人员列表
      artificerList:[],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否显示修改密码弹出层
      memberUpdatePasswordOpen: false,
      // 是否显示修改会员密码
      editMemberPasswordView: false,
      // 详情展示控制字段是否可修改
      disabledView: false,
      // 控制会员卡信息只能在添加时显示
      editDisabledView: false,
      // 详情展示控制确定与取消按钮显隐
      buttonView:true,
      // 会员对象信息 
      memberInfo: {},
      // 合并会员卡弹窗显隐
      mergeMemberListOpen:false,
      // 合并会员卡弹窗遮罩层
      mergeLoading:true,
      // 合并会员卡列表
      mergeMemberList:[],
      // 合并会员选中数组
      mergeMemberIds: [],
      // 合并的主会员id
      mergeMemberId: null,
       // 合并的主会员卡单次金额
      mergeSingleAmount: null,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        memberName: null,
        memberPhonenumper: null,
        sex: null,
        memberCard: null,
        memberType: null,
        paymentType: null,
        artificerId: null,
        cardPersonnel: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        memberName: [
          { required: true, message: "会员姓名不能为空", trigger: "blur" }
        ],
         memberPhonenumper: [
          { required: true, message: "手机号不能为空", trigger: "blur" },
          {
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: "blur"
          }
        ],
        memberCardId: [
          { required: true, message: "会员卡不能为空", trigger: "blur" }
        ],
        rechargeAmount: [
          { required: true, message: "充值金额不能为空", trigger: "blur" }
        ],
        surplusAmount: [
          { required: true, message: "剩余金额不能为空", trigger: "blur" }
        ],
        surplusTimes: [
          { required: true, message: "剩余次数不能为空", trigger: "blur" }
        ],
        paymentType: [
          { required: true, message: "支付方式不能为空", trigger: "blur" }
        ],
        memberPassword: [
          { required: true, message: "密码不能为空", trigger: "blur" },
          {
            pattern: /^\d+(\.\d{0,2})?$/,
            message: "只能输入6位以内数字",
            trigger: "blur"
          }
        ],
        confirmPassword: [
          { required: true, message: "确认密码不能为空", trigger: "blur" },
          { required: true, validator: equalToPassword, trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
    // 加载会员卡信息列表
    this.getMemberCardList();
    // 加载技师列表数据
    this.getArtificerListDat();
  },
  methods: {
    /** 查询会员信息列表 */
    getList() {
      this.loading = true;
      listMember(this.queryParams).then(response => {
        this.memberList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询会员卡列表 */
    getMemberCardList(){
      getCardList(this.queryParams).then(response => {
        this.memberCardList = response.data;
      });
    },
    /** 查询技术人员列表 */
    getArtificerListDat(){
      getArtificerList(this.queryParams).then(response => {
        this.artificerList = response.data;
      });
    },
    /** 监听下拉框选中的对象 */
    selectMemberCardInfo(event){
      // 会员卡名称
      this.form.memberCardName = event.cardName
      // 会员卡类型
      this.form.memberType = event.cardType;
      // 充值金额
      this.form.rechargeAmount = event.cardAmount;
      // 赠送金额
      this.form.giveAmount = event.cardGiveAmount;
      // 单次金额
      this.form.singleAmount = event.singleAmount;
      // 赠送次数
      this.form.surplusTimes = event.cardTimes;
      // 剩余金额 = 充值金额 + 赠送金额
      this.form.surplusAmount = event.cardAmount + event.cardGiveAmount;
    },
    /**监听办卡技师下拉事件获取label的值 */
    selectArtificerName(val){//这个val也就是value值
      console.log(val)
      let obj = this.artificerList.find(item => item.artificerId === val);
      // 判断的时候可以直接写obj而不需要以判断对象是否为空的方式是因为：如果找不到，find方法返回的是undefined而不是空对象
      if(obj) {
          this.form.artificerName= obj.artificerFullName;
      }
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        memberId: null,
        memberName: null,
        memberPhonenumper: null,
        sex: null,
        memberPassword: null,
        confirmPassword: null,
        memberCard: null,
        memberType: null,
        rechargeAmount: null,
        giveAmount: null,
        surplusAmount: null,
        paymentType: null,
        artificerId: null,
        artificerName: null,
        memberPoints: null,
        additive: null,
        additiveNumber: null,
        cardPersonnel: null,
        remark: null,
        createTime: null,
        createNema: null,
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
      this.ids = selection.map(item => item.memberId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    // 详情弹出层
    handleDetails(row){
      // 控制会员卡信息只能在添加时显示
      this.editDisabledView = true,
      this.disabledView = true;
      this.buttonView = false;
      const memberId = row.memberId || this.ids
      getMember(memberId).then(response => {
        this.form = response.data;
        //  修改功能隐藏会员密码
        this.editMemberPasswordView = false;
        this.open = true;
        this.title = "会员信息";
      });
    },
    // 续卡弹出层
    handleAddMember(row){
      this.reset();
      // 控制会员卡信息只能在添加时显示
      this.editDisabledView = false,
      this.disabledView = false;
      this.buttonView = true;
      const memberId = row.memberId || this.ids
      getMember(memberId).then(response => {
        this.form = response.data;
        this.form.memberId = null;
        //  修改功能隐藏会员密码
        this.editMemberPasswordView = false;
        this.open = true;
        this.title = "会员续卡";
      });
    },
    // 消费记录
    handleConsumptionRecord(row){
      this.$modal.msgError("暂无功能");
    },
    // 同种会员合并金额
    handleMerge(row){
      if(row.surplusAmount==0){
        this.$modal.alertWarning("赠送次数卡或者会员卡剩余金额为0不能执行合并");
      }else{
        this.mergeMemberListOpen = true;
        this.title = "合并会员信息";
        this.mergeMemberId = row.memberId;
        this.mergeSingleAmount = row.singleAmount;
        let params={
          memberId :  row.memberId,
          memberPhonenumper :  row.memberPhonenumper
        }
        // 通过会员手机号和需要合并会员id查询该会员下所有会员卡信息
        getMergeMemberList(params).then(response => {
          this.mergeMemberList = response.data;
          this.mergeLoading = false;
        })
      }
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      // 控制会员卡信息只能在添加时显示
      this.editDisabledView = false,
      this.disabledView = false;
      this.buttonView = true;
      //  添加功能显示会员密码
      this.editMemberPasswordView = true;
      this.open = true;
      this.title = "添加会员信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      // 控制会员卡信息只能在添加时显示
      this.editDisabledView = true,
      this.disabledView = false;
      this.buttonView = true;
      const memberId = row.memberId || this.ids
      getMember(memberId).then(response => {
        this.form = response.data;
        //  修改功能隐藏会员密码
        this.editMemberPasswordView = false;
        this.open = true;
        this.title = "修改会员信息";
      });
    },
    /** 修改密码按钮操作 */
    handleUpdatePwd(row) {
      const memberId = row.memberId || this.ids
      getMember(memberId).then(response => {
        this.memberInfo = response.data;
        this.memberUpdatePasswordOpen = true;
        this.title = "修改会员密码";
      });
    },

    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.memberId != null) {
            updateMember(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addMember(this.form).then(response => {
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
      const memberIds = row.memberId || this.ids;
      this.$modal.confirm('是否确认删除会员为"' + row.memberName + '"的数据项？').then(function() {
        return delMember(memberIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('business/member/export', {
        ...this.queryParams
      }, `member_${new Date().getTime()}.xlsx`)
    },
     // 合并会员卡多选框选中数据
    handleSelectionChangeByMerge(selection) {
      this.mergeMemberIds = selection.map(item => item.memberId)
    },
    // 合并会员操作实现
    handleMergeMember(){
      const memberId = this.mergeMemberId;
      const memberIds = this.mergeMemberIds.join(",");
      handleMergeMemberList(memberId,memberIds).then(response => {
        this.$modal.msgSuccess("合并成功");
        this.mergeMemberListOpen = false;
        this.getList();
      });
    },
     /**
     * 根据条件禁用行复选框
     * 函数返回值为false则禁用选择(反之亦然)
     * @param {Object} row - 行数据
     * @param {String} index - 索引值
     * @return Boolean
     */
    selectable: function(row, index){
        // 根据主会员卡的单次金额和预合并会员卡的单次金额是否相对，确定会员卡是否能选中
        if(this.mergeSingleAmount == row.singleAmount){
          return true;
        }
    },


  }
};
</script>
