<template>
    <v-flex md12 fill-height>
        <c-card
            title="Data Baptis"
        >
            <v-card-text>
                <c-table
                    :items="items"
                    :headers="headers"
                    :pager="pager"
                    :handle-edit="handleEdit"
                    :total-items="totalItems"
                    :loading="isLoading"
                    :load-page-action="getPage"
                    :set-pager-action="setPager"
                >
                </c-table>

            </v-card-text>
            <v-flex slot="actions">
                <v-btn
                    :to="{ name: 'BaptisCreate' }"
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

    export default {
        computed: mapGetters({
            deletedItem: 'baptis/del/deleted',
            error: 'baptis/list/error',
            items: 'baptis/list/items',
            isLoading: 'baptis/list/isLoading',
            view: 'baptis/list/view',
            pager: 'baptis/list/pager',
            totalItems: 'baptis/list/totalItems'
        }),

        data(){
            return {
                headers: [
                    { value: 'actions', text: ''},
                    { value: 'kodeBaptis', text: 'kodeBaptis'},
                    { value: 'buku', text: 'buku'},
                    { value: 'halaman', text: 'halaman'},
                    { value: 'nomor', text: 'nomor'},
                    { value: 'lanjutan', text: 'lanjutan'},
                    { value: 'namaBaptis', text: 'namaBaptis'},
                    { value: 'tempatBaptis', text: 'tempatBaptis'},
                    { value: 'tanggalBaptis', text: 'tanggalBaptis'},
                    { value: 'waliBaptis1', text: 'waliBaptis1'},
                    { value: 'waliBaptis2', text: 'waliBaptis2'},
                    { value: 'catatan', text: 'catatan'},
                    { value: 'nama', text: 'nama'},
                    { value: 'tempatLahir', text: 'tempatLahir'},
                    { value: 'tanggalLahir', text: 'tanggalLahir'},
                    { value: 'ayah', text: 'ayah'},
                    { value: 'ibu', text: 'ibu'},
                    { value: 'alamat', text: 'alamat'},
                ],
                primaryKey: 'id',
            }
        },

        methods: {
            ...mapActions({
                getPage: 'baptis/list/default',
                setPager: 'baptis/list/setPager'
            }),
            handleEdit(item){
                this.$router.push({name: 'BaptisUpdate', params: {id: item.id}});
            }
        }

    }
</script>
