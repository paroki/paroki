<template>
    <v-app id="inspire">
        <c-navbar
            :config="config"
        ></c-navbar>

        <v-content>
            <v-container fluid fill-height class="grey lighten-3">
                <LoadingOverlay></LoadingOverlay>
                <v-layout
                    align-left
                >
                    <router-view></router-view>
                </v-layout>
            </v-container>
        </v-content>
        <v-footer color="indigo" app>
            <span class="white--text">
                &copy; Tim Pendataan Paroki Kristus Raja Barong Tongkok 2019
            </span>
        </v-footer>
    </v-app>
</template>

<script>
    import navConfig from '../../config/nav';
    import LoadingOverlay from "./LoadingOverlay";

    export default {
        name: 'DefaultContainer',
        components: {LoadingOverlay},
        data: () => {
            return {
                config: navConfig
            }
        }
    }
</script>
