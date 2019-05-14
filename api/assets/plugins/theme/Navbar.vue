<template>
    <div>
        <v-navigation-drawer
            v-model="drawer"
            fixed
            app
        >
            <v-list>
                <div
                    v-for="(item,i) in items"
                    :key="`${item.name}-${i}`">
                    <c-nav-item :item="item"></c-nav-item>
                </div>
            </v-list>
        </v-navigation-drawer>
        <v-toolbar color="indigo" dark fixed app>
            <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
            <v-toolbar-title>SIAP</v-toolbar-title>
        </v-toolbar>
    </div>

</template>

<script>
    import CNavItem from "./NavItem";
    export default {
        name: 'navbar',
        components: {CNavItem},
        props: {
            config: {
                type: [Array, Object],
                required: true
            }
        },
        created(){
            this.items = this.parseConfig(this.config);
        },
        data(){
            return {
                items: [],
                drawer: null
            }
        },
        methods: {
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
            }
        }
    }
</script>
