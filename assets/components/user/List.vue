<template>
    <div class="animated fadeIn">
        <b-row>
            <b-col sm="12" md="12" lg="12">
                <c-table
                    :table-data="items"
                    :fields="fields"
                    :caption="caption"
                    :striped="true",
                    :primary-key="primaryKey"
                    :per-page="perPage"
                    :actions="actions"
                    :total="getTotal"
                    :load-page="handlePageNav"
                    :current-page="page"
                ></c-table>
            </b-col>
        </b-row>
    </div>
</template>

<script>
    import { mapActions, mapGetters } from 'vuex'
    import cTable from '../../components/Table';

    export default {
        components: {
            cTable
        },
        computed: {
            ...mapGetters({
                deletedItem: 'user/del/deleted',
                error: 'user/list/error',
                items: 'user/list/items',
                isLoading: 'siap/isLoading',
                view: 'user/list/view',
                total: 'user/list/total',
                page: 'user/list/page'
            }),
            getTotal: function(){
                return this.total;
            }
        },
        data(){
            const urlEdit = this.$router.resolve({
                name: 'UserUpdate',
                params: {id: '@id'}
            }).href;
            return {
                fields: [
                    { key: 'nama', label: 'Nama'},
                    { key: 'username', label: 'Username'},
                    { key: 'email', label: 'Email'},
                    { key: 'actions', label: ''}
                ],
                caption: "Administrasi Pengguna",
                primaryKey: 'id',
                actions: {
                    edit: {
                        url: urlEdit
                    }
                },
                perPage: null,
                currentPage: 1
            }
        },
        created () {
            this.handlePageNav().then(() => {
                this.perPage = this.items.length;
                this.currentPage = this.page;
                this.$emit('input',{
                    payload: { 0:  this.page }
                });
            });
        },
        methods: {
            ...mapActions({
                getPage: 'user/list/default'
            }),
            handlePageNav(page=null){
                return this.getPage(page)
                    .then(()=>{
                        return this.items;
                    })
                    .catch((e) => {
                        return [];
                    });
            }
        }
    }
</script>
