<template>
    <v-flex md-12 fill-height>
        <v-toolbar color="cyan" dark>
            <v-toolbar-title centered>Daftar User</v-toolbar-title>
        </v-toolbar>
        <v-card>
            <v-card-text>
                <c-table
                    :items="items"
                    :headers="headers"
                    :pageAction="getPage"
                    pager="user/list/pager"
                    :edit-action="editItem"
                    :actions="actions"
                    :total-items="view['totalItems']"
                    :loading="isLoading"
                >
                </c-table>
                <v-btn
                    :to="{ name: 'UserCreate' }"
                    color="cyan"
                    dark
                    absolute
                    bottom
                    left
                    fab
                >
                    <v-icon>fas fa-plus</v-icon>
                </v-btn>
            </v-card-text>
        </v-card>
    </v-flex>
</template>

<script>
    import { mapActions, mapGetters } from 'vuex'

    export default {
        computed: {
            ...mapGetters({
                deletedItem: 'user/del/deleted',
                error: 'user/list/error',
                items: 'user/list/items',
                isLoading: 'siap/isLoading',
                view: 'user/list/view',
                pager: 'user/list/pager'
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
                },
                perPage: null,
                currentPage: 1
            }
        },
        created(){
            //this.getPage();
            //this.getPage(this.pager);
        },
        methods: {
            ...mapActions({
                getPage: 'user/list/default'
            }),
            editItem(item){
                this.$router.push({name: 'UserUpdate', params: {id: item.id}});
            }
        }
    }
</script>
