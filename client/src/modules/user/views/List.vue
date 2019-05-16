<template>
    <v-flex md-12 fill-height>
        <c-card
            title="Daftar Pengguna"
        >
            <v-card-text>
                <c-table
                    :items="items"
                    :headers="headers"
                    :pager="pager"
                    :handle-edit="handleEdit"
                    :actions="actions"
                    :total-items="totalItems"
                    :loading="isLoading"
                    :load-page-action="getPage"
                    :set-pager-action="setPager"
                >
                </c-table>

            </v-card-text>
            <v-flex slot="actions">
                <v-btn
                    :to="{ name: 'UserCreate' }"
                    color="cyan"
                    dark
                >
                    <v-icon v-text="$vuetify.icons.add"></v-icon>
                    Data Baru
                </v-btn>
                <c-pagination
                    :total-items="totalItems"
                    :set-pager-action="setPager"
                    :load-page-action="getPage"
                    :pager="pager"
                    fill-height
                    :circle="true"
                >
                </c-pagination>
            </v-flex>
        </c-card>
    </v-flex>
</template>

<script>
    import { mapActions, mapGetters } from 'vuex'
    import CPagination from "../../../components/core/Pagination";

    export default {
        components: {CPagination},
        computed: {
            ...mapGetters({
                deletedItem: 'user/del/deleted',
                error: 'user/list/error',
                items: 'user/list/items',
                isLoading: 'user/list/isLoading',
                view: 'user/list/view',
                pager: 'user/list/pager',
                totalItems: 'user/list/totalItems'
            })
        },
        data(){
            const urlEdit = this.$router.resolve({
                name: 'UserUpdate',
                params: {id: '@id'}
            }).href;
            return {
                headers: [
                    { value: 'actions', text: ''},
                    { value: 'nama', text: 'Nama'},
                    { value: 'username', text: 'Username'},
                    { value: 'email', text: 'Email'},
                ],
                caption: "Administrasi Pengguna",
                primaryKey: 'id',
                actions: {
                    edit: {
                        url: urlEdit
                    },
                    delete: {

                    }
                }
            }
        },
        methods: {
            ...mapActions({
                getPage: 'user/list/default',
                setPager: 'user/list/setPager'
            }),
            handleEdit(item){
                this.$router.push({name: 'UserUpdate', params: {id: item.id}});
            }
        }
    }
</script>
