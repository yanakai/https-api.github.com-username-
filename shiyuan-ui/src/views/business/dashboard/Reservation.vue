<!-- 订单预约 -->
<template>
    <el-row :gutter="20">
        <el-col :xs="24" :sm="24" :md="24" :lg="24">
            <el-tabs type="border-card" v-model="activeName" @tab-click="handleTabsClick">
                <el-tab-pane name="first">
                    <span slot="label"><i class="el-icon-date"></i> 预约</span>
                    <el-col :xs="24" :sm="24" :md="24" :lg="12">
                        <el-card class="box-card">
                            <div slot="header" class="clearfix">
                                <span>预约列表</span>
                                <el-button style="float: right; padding: 3px 0" type="text">操作按钮</el-button>
                            </div>
                            <el-table stripe :data="yuYueDataList">
                                <el-table-column label="技师" align="center" prop="artificerName" />
                                <el-table-column label="客户姓名" align="center" prop="artificerName2" />
                                <el-table-column label="预约时间" align="center" prop="artificerName2" />
                                <el-table-column label="下钟时间" align="center" prop="artificerName3" />
                                <el-table-column label="操作" align="center" prop="artificerName4" />
                            </el-table>
                        </el-card>
                    </el-col>
                    <el-col :xs="24" :sm="24" :md="24" :lg="12">
                        <el-card class="box-card">
                            <div slot="header" class="clearfix">
                                <span>上钟列表</span>
                                <el-button style="float: right; padding: 3px 0" type="text">操作按钮</el-button>
                            </div>
                            <el-table stripe :data="yuYueDataList">
                                <el-table-column label="技师" align="center" prop="artificerName" />
                                <el-table-column label="客户姓名" align="center" prop="artificerName2" />
                                <el-table-column label="开单时间" align="center" prop="artificerName2" />
                                <el-table-column label="下钟时间" align="center" prop="artificerName3" />
                                <el-table-column label="操作" align="center" prop="artificerName4" />
                            </el-table>
                        </el-card>
                    </el-col>
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
            artificerName:"技师1",
        },
        {
            artificerName:"技师2",
        },
        {
            artificerName:"技师3",
        },
        {
            artificerName:"技师4",
        },
        {
            artificerName:"技师5",
        },
        {
            artificerName:"技师6",
        },
        {
            artificerName:"技师7",
        },
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
  },
};
</script>

<style lang="scss">

</style>
