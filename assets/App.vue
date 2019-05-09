<template>
<div>
    <router-view></router-view>
</div>
</template>


<script>
    export default {
        name: 'App',
        data: () => ({
            menuVisible: false
        })
    }
</script>
<style lang="scss">
    // CoreUI Icons Set
    @import '~@coreui/icons/css/coreui-icons.min.css';
    /* Import Font Awesome Icons Set */
    $fa-font-path: '~font-awesome/fonts/';
    @import '~font-awesome/scss/font-awesome.scss';
    /* Import Simple Line Icons Set */
    $simple-line-font-path: '~simple-line-icons/fonts/';
    @import '~simple-line-icons/scss/simple-line-icons.scss';
    /* Import Flag Icons Set */
    /* Import Bootstrap Vue Styles */
    @import '~bootstrap-vue/dist/bootstrap-vue.css';
    // Import Main styles for this application
    @import 'scss/style';
</style>
