<template>
    <v-pagination
        v-bind="$attrs"
        :length="getLength"
        v-model="pagination"
    ></v-pagination>
</template>

<script>
    export default {
        name: 'c-pagination',
        props: {
            pager: {
                type: [Array, Object],
                required: true
            },

            loadPageAction: {
                type: Function,
                required: true
            },
            totalItems: {
                type: Number,
                default: 0
            },
            setPagerAction: {
                type: Function,
                required: true
            }
        },
        data: () => {
            return {
                length: 0,
                page: 1
            }
        },
        created(){

        },
        computed: {
            pagination: {
                set: function(value){
                    this.pager.page = value;
                    this.setPagerAction(this.pager);
                },
                get: function(){
                    return this.pager.page;
                }
            },
            getLength(){
                return Math.round(this.totalItems/this.pager.rowsPerPage)
            }
        },
        watch: {
            pagination: {
                handler(){
                    this.loadPageAction();
                }
            }
        }
    }
</script>

<style lang="scss">
    .v-pagination {
        line-height: 1.5em !important;
    }
</style>
