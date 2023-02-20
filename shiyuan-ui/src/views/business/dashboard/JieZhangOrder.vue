<!-- 首页结账对话框 -->
<template>
   <div class="app-container">
      <el-dialog :title="title" :visible.sync="open" width="1000px" @closed="closed" @close="cancel"  append-to-body>
         <el-form ref="form" :model="form" :rules="rules" label-width="90px">
         <el-row>
            <el-col :span="12">
               <el-form-item label="开单技师" prop="artificerId">
               <el-select v-model="form.artificerName" placeholder="请选择技师名称"
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
               <el-select v-model="form.additionalId" placeholder="请选择服务项目"
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
                  v-model="form.endTime"
                  type="datetime"
                  value-format="yyyy-MM-dd HH:mm"
                  placeholder="请选择结束时间">
               </el-date-picker>
               </el-form-item>
            </el-col>
            <el-col :span="8">
               <el-form-item label="结账方式" prop="paymentType">
               <el-select v-model="form.paymentType"  placeholder="请选择支付方式" 
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
               <el-input v-model="form.orderAmount" placeholder="请输入会员卡金额" />
               </el-form-item>
            </el-col>
         </el-row>
         <el-row>
            <el-col :span="8">
               <el-form-item label="剩余金额" prop="cardSurplusAmount">
               <el-input v-model="form.cardSurplusAmount" :disabled="true" />
               </el-form-item>
            </el-col>
            <el-col :span="8">
               <el-form-item label="剩余次数" prop="cardSurplusNum">
               <el-input v-model="form.cardSurplusNum" :disabled="true"/>
               </el-form-item>
            </el-col>
            <el-col :span="8">
               <el-form-item label="消费次数" prop="orderTimes">
               <el-input v-model="form.orderTimes" :disabled="true"/>
               </el-form-item>
            </el-col>
         </el-row>
         <el-row>
            <el-col :span="24">
               <el-form-item label="密码" prop="memberJieZhangPassword">
               <el-input v-model="form.memberJieZhangPassword" />
               </el-form-item>
            </el-col>
         </el-row>
         </el-form>
         <div slot="footer" class="dialog-footer">
            <el-button type="primary" @click="submitForm">确认结账</el-button>
            <el-button @click="cancel">取消结账</el-button>
            <el-button type="primary" @click="submitWuMiMaForm">无密码结账</el-button>
         </div>
      </el-dialog>
   </div>
</template>

<script>
import { savePaymentData} from "@/api/business/order";
import { additionalList } from "@/api/business/additional";
import { getArtificerList } from "@/api/business/artificer";
import {memberList} from "@/api/business/member";

export default {
   name: "Order",
   props: ["jieZhangForm"],// 接收父组件的数据
   dicts: ['b_additional_type', 'b_order_bell_type', 'b_order_state', 'b_order_payment_type'],
   data () {
      return {
         // 弹出层标题
         title: "新增开单信息",
         //弹窗显示状态
         open:true,
         // 表单参数
         form: {
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
         // 表单校验
         rules: {
            paymentType: [
               { required: true, message: "结账方式不能为空", trigger: "blur" }
            ],
            // memberJieZhangPassword: [
            //   { required: true, message: "结账密码不能为空", trigger: "blur" }
            // ],
         },
         //主服务项目列表
         zhuAdditionalList: [],
         // 辅助项目列表
         fuZhuAdditionalList: [],
         // 技师列表
         artificerList: [],
         // 定义结账弹窗选择辅助项目的复选框选中数组
         additionalIds:[],
         //选择的辅助项目金额
         fuZhuAdditionalAmount:0,
         //选择的主服务项目金额
         zhuAdditionalAmount:0,
         // 会员密码校验
         confirmPassword: null,
         // 会员搜索回显
         memberName:"",
         // 选中会员信息
         memberInfoData: null,
         // 是否显示会员信息
         memberInfoDataView: false,
      }
   },
   created() {
      this.reset();
      this.open = true;
      this.title = "结账弹窗";
      // 赋值父组件传来的表单数据
      this.form = this.jieZhangForm;
      // 赋值主服务项目金额
      this.zhuAdditionalAmount = this.form.orderAmount;
      // 加载结账时间
      this.form.endTime = this.parseTime(new Date(),"{y}-{m}-{d} {h}:{i}");
      // 加载主服务项目列表
      this.getZhuAdditionalList();
      // 加载附加项项目列表
      this.getFuZhuAdditionalList();
      // 加载技师列表数据
      this.getArtificerListDat();
   },   
   methods: {
      // 取消按钮
      cancel() {
         this.reset();
         this.open = false;
         this.$emit('handleCancelJieView', 'quXiao')
      },
      // 重置结账表单
      reset() {
         this.additionalIds = [];
         this.memberName= "";
         this.memberInfoDataView = false;
         this.form = {
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
         this.resetForm("form");
      },
      
      /** 查询主服务和附加项项目列表 1：主服务；2：附加项*/
      getZhuAdditionalList(){
         const params = {dataType:1};
         additionalList(params).then(response => {
            this.zhuAdditionalList = response.data;
         })
      },
       /**监听主服务项目下拉  计算结账金额 */
      selectZhuAdditional(val){//这个val也就是value值
         let obj = this.zhuAdditionalList.find(item => item.additionalId === val);
         // 判断的时候可以直接写obj而不需要以判断对象是否为空的方式是因为：如果找不到，find方法返回的是undefined而不是空对象
         if(obj) {
            this.jieZhangForm.orderAmount = this.fuZhuAdditionalAmount + obj.additionalAmount;
         }
      },
       /** 查询主服务和附加项项目列表 1：主服务；2：附加项*/
      getFuZhuAdditionalList(){
         const params = {dataType:2};
         additionalList(params).then(response => {
            this.fuZhuAdditionalList = response.data;
         })
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
         this.form.orderAmount = this.fuZhuAdditionalAmount + this.zhuAdditionalAmount;
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
         this.form.memberId = item.memberId;
         // 选中会员的名称赋值
         this.memberName = item.memberName;
         // 回显选中的会员信息
         this.memberInfoData = item.memberName +" "+ item.memberPhonenumper +" "+item.memberCardName +" "+ item.surplusAmount ;
         if(item.remark){
         this.memberInfoData = item.memberName +" "+ item.memberPhonenumper +" "+item.memberCardName +" "+ item.surplusAmount + " 备注："+ item.remark;
         }
         // 回显结账方式自动赋值到会员
         this.form.paymentType = '1';
         // 判断当前选中的会员类型 1:赠送金额卡；2:赠送次数卡
         if(item.memberType == 1){
         if(item.surplusAmount < this.form.orderAmount){
            this.$modal.alertWarning("当前会员不足以支付本次订单！！！");
            // 当会员剩余金额不够本次支付时，该订单金额= 该会员剩余金额 ，未支付金额重新创建订单支付
            this.form.orderAmount = item.surplusAmount;
            // 会员剩余金额设置为0；
            this.form.cardSurplusAmount = 0;
         }else{
            // 赠送金额卡会员 计算剩余金额
            if(item.singleAmount < this.zhuAdditionalAmount){
               this.$modal.alertWarning("当前会员为老会员，使用老卡的支付方式");
            }
            // 会员结账金额 = 辅助项目金额 + 该会员的单次金额
            this.form.orderAmount = this.fuZhuAdditionalAmount + item.singleAmount ;
            // 会员剩余金额 = 会员剩余金额
            this.form.cardSurplusAmount = item.surplusAmount;
            // 赠送金额卡会员 剩余次数为0
            this.form.cardSurplusNum = 0;
            // 赠送金额卡会员 当前消费次数为0
            this.form.orderTimes = 0;
         }
         }else {
         // 赠送次数会员 结账金额为 0  辅助项目不能选取
         this.form.orderAmount = 0;
         // 赠送次数会员 剩余金额为0
         this.form.cardSurplusAmount = 0;
         // 赠送次数卡 计算剩余次数
         if(item.surplusTimes > 0){
            // 选中会员的剩余次数 = 会员剩余次数
            this.form.cardSurplusNum = item.surplusTimes;
            // 当前消费次数
            this.form.orderTimes = 1;
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
         this.form.cardSurplusNum = 0;
         // 赠送金额卡会员 当前消费次数为0
         this.form.orderTimes = 0;
         // 赠送次数会员 剩余金额为0
         this.form.cardSurplusAmount = 0;
         // 清空结账方式
         this.form.paymentType=null;
         this.form.paymentType=null;
         // 重置结账金额 账单金额 = 主服务项目金额 + 辅助项目金额
         this.form.orderAmount = this.zhuAdditionalAmount + this.fuZhuAdditionalAmount;
         }
      },
      /**监听结账方式下拉 */
      selectPaymentTypeChange(val){//这个val也就是value值
         if(val == '1'){ // 当选择的结账方式是会员时 判断是否已选会员
         if(this.memberName ==null || this.memberName ==""){
            this.form.paymentType=null;
            this.form.paymentType=null;
            this.$modal.alertWarning("请选择会员信息");
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
      /** 确认结账按钮操作 */
      submitForm(){
         if(this.form.memberJieZhangPassword){
         this.$refs["form"].validate(valid => {
            if (valid) {
               if(this.form.memberJieZhangPassword){
                  if(this.form.memberJieZhangPassword != this.confirmPassword){
                     this.$modal.alertWarning("会员密码错误");
                     return ;
                  }
               }
               // 赋值选中的辅助项目
               this.form.additionalIds = this.additionalIds;
               savePaymentData(this.form).then(response => {
                  this.$modal.msgSuccess("结账成功");
                  this.open = false;
                  this.$emit('handleCancelJieView', 'save'); // 待用父组件的方法
               });
            }
         })
         }else{
         this.$modal.alertWarning("结账密码不能为空");
         return ;
         }
         
      },
      // 无密码结账
      submitWuMiMaForm(){
         this.$refs["form"].validate(valid => {
         if (valid) {
            // 赋值选中的辅助项目
            this.form.additionalIds = this.additionalIds;
            savePaymentData(this.form).then(response => {
               this.$modal.msgSuccess("结账成功");
               this.open = false;
               this.$emit('handleCancelJieView', 'save'); // 待用父组件的方法
            });
         }
         })
      },
   }
}
</script>