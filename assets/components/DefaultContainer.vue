<template>
    <div class="app">
        <AppHeader fixed>
            <SidebarToggler class="d-lg-none" display="md" mobile />
            <b-link class="navbar-brand" to="#">
                <!--
                <img class="navbar-brand-full" src="img/brand/logo.svg" width="89" height="25" alt="PKRBT">
                <img class="navbar-brand-minimized" src="img/brand/sygnet.svg" width="30" height="30" alt="CoreUI Logo">
                -->
                <span class="navbar-brand-full">SIAP</span>
            </b-link>
            <SidebarToggler class="d-md-down-none" display="lg" />
            <AsideToggler class="d-lg-none" mobile />
        </AppHeader>
        <div class="app-body">
            <AppSidebar fixed>
                <SidebarHeader/>
                <SidebarForm/>
                <SidebarNav :navItems="nav"></SidebarNav>
                <SidebarFooter/>
                <SidebarMinimizer/>
            </AppSidebar>
            <main class="main">
                <Breadcrumb :list="list"/>
                <div class="container-fluid">
                    <router-view></router-view>
                </div>
            </main>
            <AppAside fixed>
                <!--aside-->
                <!--
                <DefaultAside/>
                -->
            </AppAside>
        </div>
        <TheFooter>
            <!--footer-->
            <div>
                <a href="https://github.com/paroki/paroki">SIAP</a>
                <span class="ml-1">&copy; 2018 DoyoLabs.</span>
            </div>
        </TheFooter>
    </div>
</template>

<script>
    import nav from '../config/nav'
    import { Header as AppHeader, SidebarToggler, Sidebar as AppSidebar, SidebarFooter, SidebarForm, SidebarHeader, SidebarMinimizer, SidebarNav, Aside as AppAside, AsideToggler, Footer as TheFooter, Breadcrumb } from '@coreui/vue'

    export default {
        name: 'DefaultContainer',
        components: {
            AsideToggler,
            AppHeader,
            AppSidebar,
            AppAside,
            TheFooter,
            Breadcrumb,
            //DefaultAside,
            //DefaultHeaderDropdownAccnt,
            SidebarForm,
            SidebarFooter,
            SidebarToggler,
            SidebarHeader,
            SidebarNav,
            SidebarMinimizer
        },
        data () {
            return {
                nav: nav.items
            }
        },
        computed: {
            name () {
                return this.$route.name
            },
            list () {
                return this.$route.matched.filter((route) => route.name || route.meta.label )
            }
        }
    }
</script>
