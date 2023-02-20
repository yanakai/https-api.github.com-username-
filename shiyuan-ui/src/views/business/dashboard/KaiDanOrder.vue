<!-- 首页开单对话框 -->
<template>
   <div class="app-container">
    <el-dialog :title="title" :visible.sync="open" width="750px" @closed="closed" @close="cancel" append-to-body>
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
                    :disabled="item.bellState"
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
   </div>
</template>

<script>
import { addOrder} from "@/api/business/order";
import { additionalList } from "@/api/business/additional";
import { getArtificerList} from "@/api/business/artificer";

export default {
   name: "Order",
   dicts: ['b_additional_type', 'b_order_bell_type', 'b_order_state', 'b_order_payment_type'],
   data () {
      return {
         // 弹出层标题
         title: "新增开单信息",
         //弹窗显示状态
         open:true,
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
         //主服务项目列表
         zhuAdditionalList: [],
         // 技师列表
         artificerList: [],
      }
   },
   created() {
      this.reset();
      this.open = true;
      this.title = "新增订单信息";
      // 加载开单时间
      this.form.startTime = this.parseTime(new Date(),"{y}-{m}-{d} {h}:{i}");
      // 加载主服务项目列表
      this.getZhuAdditionalList();
      // 加载技师列表数据
      this.getArtificerListDat();
   },   
   methods: {
      // 取消按钮
      cancel() {
         this.reset();
         this.open = false;
         this.$emit('handleKaiDanOrder', 'quXiao')
      },
      // 表单重置
      reset() {
         this.form = {
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
      /** 查询主服务和附加项项目列表 1：主服务；2：附加项*/
      getZhuAdditionalList(){
         const params = {dataType:1};
         additionalList(params).then(response => {
            this.zhuAdditionalList = response.data;
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
            this.form.orderState = '1' // 赋值订单状态 订单状态  0：预约中；1：已开单；2：已支付
            addOrder(this.form).then(response => {
               this.$modal.msgSuccess("新增成功");
               this.open = false;
               this.$emit('handleKaiDanOrder', 'save')
            });
         }
         });
      },
   }
}
</script>