<template>
    <v-list-tile
        v-if="!item.children"
        :to="{name: item.name}"
    >
        <v-list-tile-action v-if="item.icon">
            <v-icon>{{ item.icon }}</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
            <v-list-tile-title>{{ item.label }}</v-list-tile-title>
        </v-list-tile-content>
    </v-list-tile>
    <v-list-group
        prepend-icon="account_circle"
        v-else-if="item.hasChildren"
    >
            <template v-slot:activator>
                <v-list-tile>
                    <v-list-tile-title>{{item.label}}</v-list-tile-title>
                </v-list-tile>
            </template>
            <c-nav-item
                v-for="(children,i) in item.children"
                :key="`id-${children.name}-${i}`"
                :item="children"
            ></c-nav-item>
    </v-list-group>
</template>

<script>
    export default {
        name: 'c-nav-item',
        props: {
            item: {
                type: [Array, Object],
                required: true
            },
            level: {
                type: Number,
                default: 0
            }
        },
        methods: {
            navigate(item){
                //console.log(item.path);
                const loc = this.$router.resolve({name: item.name});
                this.$router.push(loc.href);
            }
        }
    }
</script>
