<template>
    <v-flex md12 fill-height>
        <c-card
            title="Edit data Baptis"
        >
            <v-card-text>
                <BaptisForm
                :handle-submit="onSendForm"
                :handle-update-field="updateField"
                :values="item"
                :errors="violations"
                :initial-values="retrieved" />
            </v-card-text>
            <v-flex slot="actions">
                <v-btn
                    :to="{ name: 'BaptisList' }"
                    color="info"
                >
                    <v-icon left v-text="$vuetify.icons.back"></v-icon>
                    Kembali
                </v-btn>
                <v-btn
                    @click="onSendForm"
                    color="success"
                    :loading="isLoading"
                >
                    <v-icon left v-text="$vuetify.icons.save"></v-icon>
                    Simpan
                </v-btn>
                <v-btn
                    color="error"
                    @click="dialogActivator = true"
                    dark
                >
                    <v-icon v-text="$vuetify.icons.delete"></v-icon>
                    Hapus
                </v-btn>
            </v-flex>
        </c-card>
        <c-simple-dialog
            title="Konfirmasi Hapus Data"
            content="Apakah anda yakin ingin menghapus data ini?"
            :resolve="onDelete"
            :activator="dialogActivator"
        >
        </c-simple-dialog>
    </v-flex>
</template>

<script>
    import { mapActions, mapGetters } from 'vuex'
    import BaptisForm from './Form.vue'

    export default {
        components: {
            BaptisForm
        },

        data () {
            return {
                item: {},
                dialogActivator: false
            }
        },

        computed: {
        ...mapGetters({
                isLoading: 'baptis/update/isLoading',
                error: 'baptis/update/error',
                deleteError: 'baptis/del/error',
                deleteLoading: 'baptis/del/isLoading',
                created: 'baptis/create/created',
                deleted: 'baptis/del/deleted',
                retrieved: 'baptis/update/retrieved',
                updated: 'baptis/update/updated',
                violations: 'baptis/update/violations'
            })
        },

        watch: {
            // eslint-disable-next-line object-shorthand,func-names
            deleted: function (deleted) {
                if (!deleted) {
                    return
                }

                this.$router.push({ name: 'BaptisList' })
            }
        },

        beforeDestroy () {
            this.reset()
        },

        created () {
            this.retrieve(decodeURIComponent(this.$route.params.id))
            if(this.created){
                this.snackbarSuccess('Data Baptis berhasil ditambahkan!');
            }
        },

        methods: {
            ...mapActions({
                createReset: 'baptis/create/reset',
                deleteItem: 'baptis/del/del',
                delReset: 'baptis/del/reset',
                retrieve: 'baptis/update/retrieve',
                updateReset: 'baptis/update/reset',
                update: 'baptis/update/update',
                updateRetrieved: 'baptis/update/updateRetrieved',
                snackbarSuccess: 'siap/snackbarSuccess',
                snackbarError: 'siap/snackbarError'
            }),

            onDelete(val) {
                if(val){
                    this.deleteItem(this.retrieved);
                }
                this.dialogActivator = false;
            },

            reset () {
                this.updateReset()
                this.delReset()
                this.createReset()
            },

            onSendForm () {
                this.update()
                    .then(() => {
                        if(!this.error){
                            this.snackbarSuccess('Perubahan data berhasil disimpan!');
                        }else{
                            this.snackbarError('Gagal menyimpan data, periksa kembali isian anda!');
                        }
                    });
            },

            updateField (field, value) {
                this.updateRetrieved({ [field]: value })
            }
        }
    }
</script>
