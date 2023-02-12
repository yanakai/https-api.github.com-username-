<!-- 订单预约 -->
<template>
    <el-row :gutter="20">
        <el-col :xs="24" :sm="24" :md="24" :lg="24">
            <el-tabs type="border-card" v-model="activeName" @tab-click="handleTabsClick">
                <el-tab-pane name="first">
                    <span slot="label"><i class="el-icon-date"></i> 预约</span>
                    <el-table stripe :data="yuYueDataList" :row-style="rowStyle">>
                        <el-table-column label="状态" align="center" prop="orderState" />
                        <el-table-column label="师傅1" align="center" prop="artificerName1">
                            <template slot-scope="scope">
                                <span @click="handleOrder(scope.row)">{{ scope.row.artificerName1}}</span>
                            </template>
                        </el-table-column>
                        <el-table-column label="师傅2" align="center" prop="artificerName2" />
                        <el-table-column label="师傅3" align="center" prop="artificerName3" />
                        <el-table-column label="师傅4" align="center" prop="artificerName4" />
                        <el-table-column label="师傅5" align="center" prop="artificerName5" />
                        <el-table-column label="师傅6" align="center" prop="artificerName6" />
                        <el-table-column label="师傅7" align="center" prop="artificerName7" />
                        <el-table-column label="师傅8" align="center" prop="artificerName8" />
                    </el-table>
                </el-tab-pane>
                <el-tab-pane name="second">
                    <span slot="label"><i class="el-icon-monitor"></i> 统计</span>
                    统计
                </el-tab-pane>
                <el-tab-pane name="third">
                    <span slot="label"><i class="el-icon-time"></i> 排钟</span>
                    排钟
                </el-tab-pane>
            </el-tabs>
        </el-col>
    </el-row>
</template>


<script>
export default {
 
  data() {
    return {
      // 默认选项卡选中第一个
      activeName: 'first',
      //预约列表数据
      yuYueDataList:[
        {
            orderState:"预约",
            artificerName1:"预约时间：18:00\n技师：李四\n客户：麻子\n下钟时间：19:00",
            artificerName2:"预约时间：18:20\n技师：李欢\n客户：麻子\n下钟时间：19:20"
        },
        {
            orderState:"开单",
            artificerName1:"开单时间：17:00\n技师：张三\n客户：麻子\n下钟时间：18:00"
        }
      ],
    };
  },
  created(){
   // this.getYuYueDataList();
  },
  methods: {
    // 选项卡操作事件
    handleTabsClick(tab, event) {
        console.log(tab, event);
        console.log(this.activeName);
        this.getYuYueDataList();
    },
    // 加载预约列表数据
    getYuYueDataList(){
        const startTime = this.$moment().add(-1, 'hour').format("yyyy-MM-DD HH:mm");// 获取当前上一个小时的时间
        // 1)将日期字符串转化为日期对象
        let startDate = new Date(startTime);
        let startHour = startDate.getHours();
        for(let i=startHour;i<24; i++){
            for(let k=0; k<60; k++){
                console.log(i+":"+k);
            }
        }
    },
    handleOrder(row){
        console.log(row)
    },
    // 设置首行背景颜色
    rowStyle({row, rowIndex}) {
        if(rowIndex === 0){
            return { 'background': 'rgb(16 214 227)'};
        } else {
            return {};
        }
    },

  },
};
</script>

<style lang="scss">
//或者全局换行
.el-table {
    .cell{
        white-space: pre-wrap !important;
    }
}
</style>
