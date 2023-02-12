<template>
  <div class="app-container home dashboard-editor-container">
     <h4 class="text-navy">
      欢迎使用典唐按摩系统,我们提供更好的服务 现在时间：{{parseTime(currentTime)}}
    </h4>
    <panel-group />
    <reservation />
  </div>
</template>

<script>
import PanelGroup from './business/dashboard/PanelGroup'
import Reservation from './business/dashboard/Reservation'
export default {
  name: "Index",
  components: {
    PanelGroup,
    Reservation
  },
  data() {
    return {
      // 默认选项卡选中第一个
      activeName: 'first',
      currentTime: new Date(),
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
    }
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

