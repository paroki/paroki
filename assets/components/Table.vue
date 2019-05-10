<template>
    <b-card >
        <div slot="header">
            <div class="table-caption">
                <i class="fa fa-wechat"></i>
                {{caption}}
            </div>
            <div class="card-header-actions">
                <nav class="card-header-action">
                    <b-pagination :total-rows="totalRows" :per-page="perPage" v-model="currentPage" prev-text="<" next-text=">"/>
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
            :items="items"
            :fields="captions"
            :current-page="currentPage"
            :per-page="perPage"
            :primary-key="primaryKey"
            :total="total"
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
            total: {
                type: Number,
                default: 0
            }
        },
        data: () => {
            return {
                currentPage: 1,
            }
        },
        computed: {
            items: function() {
                const items =  this.tableData
                return Array.isArray(items) ? items : items()
            },
            totalRows: function () { return this.getRowCount() },
            captions: function() { return this.fields }
        },
        methods: {
            navigate(template,item){
                const href= template.replace('{id}',item[this.primaryKey]);
                this.$router.push(href);
                console.log(href);
            },
            getBadge (status) {
                return status === 'Active' ? 'success'
                    : status === 'Inactive' ? 'secondary'
                        : status === 'Pending' ? 'warning'
                            : status === 'Banned' ? 'danger' : 'primary'
            },
            getRowCount: function () {
                return this.items.length
            }
        }
    }
</script>
