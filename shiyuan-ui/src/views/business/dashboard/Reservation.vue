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
                            <el-table stripe :data="yuYueOrderList">
                                <el-table-column label="师傅名称" align="center" prop="artificerName" />
                                <el-table-column label="客户姓名" align="center" prop="artificerName2" />
                                <el-table-column label="预约时间" align="center" prop="artificerName2" />
                                <el-table-column label="下钟时间" align="center" prop="artificerName3" />
                                <el-table-column label="备注" align="center" prop="remark" />
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
                            <el-table stripe :data="kaiDanOrderList">
                                <el-table-column label="师傅名称" align="center" prop="artificerName" />
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
      //预约订单列表数据
      yuYueOrderList:[],
      //开单订单列表数据
      kaiDanOrderList:[],
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
    getYuYueOrderList(){
       
    },
  },
};
</script>

<style lang="scss">

</style>
