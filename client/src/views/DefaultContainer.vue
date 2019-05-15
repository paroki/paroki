<template>
    <v-app id="inspire">
        <c-drawer
            :config="config"
        ></c-drawer>
        <c-toolbar></c-toolbar>
        <v-content>
            <v-container fluid fill-height class="grey lighten-3">
                <c-snackbar/>
                <router-view></router-view>
            </v-container>
        </v-content>
    </v-app>
</template>

<script>
    import navConfig from '../config/nav';

    export default {
        name: 'DefaultContainer',
        data: () => {
            return {
                config: navConfig,
                drawer: null
            }
        }
    }
</script>
