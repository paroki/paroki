<template>
    <v-toolbar color="blue" dark fixed app>
        <v-toolbar-side-icon @click.stop="toggleDrawer(!drawer)"></v-toolbar-side-icon>
        <v-toolbar-title>SIAP</v-toolbar-title>
    </v-toolbar>
</template>

<script>
    import { mapActions, mapGetters } from 'vuex';
    export default {
        name: 'c-toolbar',
        props: {
        },
        computed: {
            ...mapGetters({
                drawer: 'siap/drawer'
            })
        },
        methods: {
            ...mapActions({
                toggleDrawer: 'siap/toggleDrawer'
            })
        }
    }
</script>
