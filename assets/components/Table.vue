<template>
    <b-card >
        <div slot="header">
            <div class="table-caption">
                <i class="fa fa-wechat"></i>
                {{caption}}
            </div>
            <div class="card-header-actions">
                <nav class="card-header-action">
                    <b-pagination
                        :total-rows="total"
                        :per-page="perPage"
                        :current-page="currentPage"
                        prev-text="<"
                        next-text=">"
                        @change="loadPage"
                        small
                    />
                </nav>
            </div>
        </div>
        <b-table
            :dark="dark"
            :hover="hover"
            :striped="striped"
            :bordered="bordered"
            :small="small"
            :fixed="fixed"
            responsive="sm"
            :items="tableData"
            :fields="captions"
            :primary-key="primaryKey"
            :total-rows="total"
            :current-page="currentPage"
        >

            <template slot="actions" slot-scope="row">
                <b-button variant="success" size="sm" @click="navigate(actions.edit.url,row.item)">
                    <i class="fa fa-edit"></i>
                    Edit
                </b-button>
            </template>
            <template slot="status" slot-scope="data">
                <b-badge :variant="getBadge(data.item.status)">{{data.item.status}}</b-badge>
            </template>
        </b-table>
        <div slot="footer">
            <b-button variant="success">
                <i class="fa fa-plus-circle"></i>
                &nbsp;Baru
            </b-button>
        </div>
    </b-card>
</template>

<style>
    .card-header-action ul.pagination {
        margin: 0;
        padding: 0;
    }
    .table-caption {
        margin: 0;
        padding: 0;
        display: inline;
        line-height: 35px;
    }
</style>
<script>
    import { mapGetters } from 'vuex';
    export default {
        name: 'c-table',
        inheritAttrs: false,
        props: {
            primaryKey: {
                type: String,
                default: null
            },
            actions: {
                type: [Array, Object],
                default: () => {}
            },
            caption: {
                type: String,
                default: 'Table'
            },
            hover: {
                type: Boolean,
                default: true
            },
            striped: {
                type: Boolean,
                default: false
            },
            bordered: {
                type: Boolean,
                default: false
            },
            small: {
                type: Boolean,
                default: false
            },
            fixed: {
                type: Boolean,
                default: false
            },
            tableData: {
                type: [Array, Function],
                default: () => []
            },
            fields: {
                type: [Array, Object],
                default: () => []
            },
            perPage: {
                type: Number,
                default: 5
            },
            dark: {
                type: Boolean,
                default: false
            },
            loadPage: {
                type: Function,
                required: true
            },
            total: {
                type: Number,
                default: 0
            },
            currentPage: {
                type: Number,
                default: 1
            },
        },
        data: () => {
            return {
                //currentPage: 1,
            }
        },
        computed: {
            items: function(ctx) {
                const items =  this.tableData
                return Array.isArray(items) ? items : items(ctx)
            },
            totalRows: function () {
                return this.total;
            },
            captions: function() { return this.fields },
        },
        created(){
        },
        methods: {
            navigate(template,item){
                const href= template.replace('@id',item[this.primaryKey]);
                this.$router.push(href);
            },
            getBadge (status) {
                return status === 'Active' ? 'success'
                    : status === 'Inactive' ? 'secondary'
                        : status === 'Pending' ? 'warning'
                            : status === 'Banned' ? 'danger' : 'primary'
            },
            getRowCount: function () {
                return this.total; //this.items.length
            },

        }
    }
</script>
