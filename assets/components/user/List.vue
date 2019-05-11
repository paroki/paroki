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
                    :per-page="items.length"
                    :actions="actions"
                    :total="total"
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
        computed: mapGetters({
            deletedItem: 'user/del/deleted',
            error: 'user/list/error',
            items: 'user/list/items',
            isLoading: 'siap/list/isLoading',
            view: 'user/list/view',
            total: 'user/list/total'
        }),
        data(){
            return {
                fields: [
                    { key: 'nama', label: 'Nama'},
                    { key: 'username', label: 'Username'},
                    { key: 'email', label: 'Email'},
                    { key: 'actions', label: ''}
                ],
                caption: "Administrasi Pengguna",
                edit: this.handleEdit,
                primaryKey: 'id',
                actions: {
                    edit: {
                        url: '/user/{id}'
                    }
                }
            }
        },
        created () {
            this.getPage()
        },
        methods: {
            ...mapActions({
                getPage: 'user/list/default'
            }),
            handleRowEdit(item){

            }
        }
    }
</script>
