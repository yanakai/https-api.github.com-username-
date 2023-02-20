<template>
  <div class="app-container home dashboard-editor-container">
    <h4 class="text-navy">
      欢迎使用典唐按摩系统,我们提供更好的服务 现在时间：{{parseTime(currentTime)}}
    </h4>
    <!-- 订单统计 今日收入、今日会员、今日订单、开单按钮 -->
    <panel-group @handleKaiDanOrder="handleKaiDanOrder" />
    <!-- 预约窗口、统计窗口、排钟窗口 -->
    <reservation ref="shangZhongOrderList" />
    <!-- 开单弹窗 -->
    <kaiDanOrder  v-if="kaiDanOrderFormView" @handleKaiDanOrder="handleKaiDanOrder" />
  </div>
</template>

<script>
import PanelGroup from './business/dashboard/PanelGroup'
import Reservation from './business/dashboard/Reservation'
import KaiDanOrder from './business/dashboard/KaiDanOrder'
export default {
  name: "Index",
  components: {
    PanelGroup,
    Reservation,
    KaiDanOrder
  },
  data() {
    return {
      // 默认选项卡选中第一个
      activeName: 'first',
      currentTime: new Date(),
      // 开单表单弹窗显示状态
      kaiDanOrderFormView:false,

    };
  },
   created() {
    setInterval(() => {
      this.currentTime = new Date()
    }, 1000)
  },
  methods: {
    // 选项卡操作事件
    handleTabsClick(tab, event) {
      console.log(tab, event);
    },
    // 操作开单弹窗状态
    handleKaiDanOrder (type) {
      if (type == 'add') {
        this.kaiDanOrderFormView = true;
      } else { 
        this.kaiDanOrderFormView = false;
        if (type == 'save') { 
          // 调用另外一个子组件的方法
          this.$refs.shangZhongOrderList.getKaiDaneOrderList();
        }
      }
    },

  },
};
</script>

<style scoped lang="scss">
.home {
  h4 {
    margin-top: 0px;
  }
}
</style>

