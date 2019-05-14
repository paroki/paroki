<template>
    <div class="vld-parent">
        <loading :active.sync="isLoading"
                 :can-cancel="false"
                 :on-cancel="onCancel"
                 :is-full-page="fullPage"
                 :loader="loader"
                 :width="128"
                 :height="128"
                 :color="color"
        ></loading>

        <!--
        <label><input type="checkbox" v-model="fullPage">Full page?</label>
        <button @click.prevent="doAjax">fetch Data</button>
        -->
    </div>
</template>

<script>
    // Import component
    import Loading from 'vue-loading-overlay';
    // Import stylesheet
    import 'vue-loading-overlay/dist/vue-loading.css';
    import { mapActions, mapGetters } from 'vuex';

    export default {
        name: 'LoadingOverlay',
        data() {
            return {
                fullPage: true,
                loader: 'bars',
                color: '#007bff'
            }
        },
        components: {
            Loading
        },
        computed: {
            ...mapGetters({
                isLoading: 'siap/isLoading'
            })
        },
        methods: {
            onCancel() {
                console.log('User cancelled the loader.')
            }
        }
    }
</script>
