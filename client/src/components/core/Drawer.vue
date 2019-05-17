<template>
    <v-navigation-drawer
        v-model="drawer"
        width="260px"
        fixed
        app
    >
        <v-list>
            <c-drawer-item
                v-for="(item,i) in items"
                :key="`${item.name}-${i}`"
                :item="item">
            </c-drawer-item>
            <v-list-tile
                @click="logout"
            >
                <v-list-tile-action>
                    <v-icon v-text="$vuetify.icons.logout"></v-icon>
                </v-list-tile-action>
                <v-list-tile-content>
                    <v-list-tile-title>Logout</v-list-tile-title>
                </v-list-tile-content>
            </v-list-tile>
        </v-list>
    </v-navigation-drawer>
</template>

<script>
    import { mapGetters, mapActions } from 'vuex';

    export default {
        name: 'c-drawer',
        props: {
            config: {
                type: [Array, Object],
                required: true
            },

        },
        computed: {
            ...mapGetters({
                drawerState: 'siap/drawer'
            }),
            drawer: {
                set(val){
                    this.toggleDrawer(val);
                },
                get(){
                    return this.drawerState;
                }
            }
        },
        created(){
            this.items = this.parseConfig(this.config);
        },
        data(){
            return {
                items: []
            }
        },
        methods: {
            ...mapActions({
                toggleDrawer: 'siap/toggleDrawer'
            }),
            parseConfig(config, level=0){
                if(!config) return config;
                const items = [];
                config.forEach(item => {
                    item = {
                        label: item.name,
                        icon: null,
                        hasChildren: false,
                        active: false,
                        level: level,
                        ...item
                    };
                    if(item.children){
                        item.hasChildren = true;
                        item.children = this.parseConfig(item.children, level+1);
                    }
                    items.push(item);
                });
                return items;
            },
            logout(){
                this.$router.push({name: 'Logout'});
            }
        }
    }
</script>
