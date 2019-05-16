<template>
    <v-flex md12 fill-height>
        <c-card
            title="Edit data {{titleUcFirst}}"
        >
            <v-card-text>
                <{{{titleUcFirst}}}Form
                v-if="item"
                :handle-submit="onSendForm"
                :handle-update-field="updateField"
                :values="item"
                :errors="violations"
                :initial-values="retrieved" />
            </v-card-text>
            <v-flex slot="actions">
                <v-btn
                    :to="{ name: '{{{titleUcFirst}}}List' }"
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
    import {{{titleUcFirst}}}Form from './Form.vue'

    export default {
        components: {
            {{{titleUcFirst}}}Form
        },

        data () {
            return {
                item: {},
                dialogActivator: false
            }
        },

        computed: {
        ...mapGetters({
                isLoading: '{{{lc}}}/update/isLoading',
                error: '{{{lc}}}/update/error',
                deleteError: '{{{lc}}}/del/error',
                deleteLoading: '{{{lc}}}/del/isLoading',
                created: '{{{lc}}}/create/created',
                deleted: '{{{lc}}}/del/deleted',
                retrieved: '{{{lc}}}/update/retrieved',
                updated: '{{{lc}}}/update/updated',
                violations: '{{{lc}}}/update/violations'
            })
        },

        watch: {
            // eslint-disable-next-line object-shorthand,func-names
            deleted: function (deleted) {
                if (!deleted) {
                    return
                }

                this.$router.push({ name: '{{{titleUcFirst}}}List' })
            }
        },

        beforeDestroy () {
            this.reset()
        },

        created () {
            this.retrieve(decodeURIComponent(this.$route.params.id))
            if(this.created){
                this.snackbarSuccess('Data {{{titleUcFirst}}} berhasil ditambahkan!');
            }
        },

        methods: {
            ...mapActions({
                createReset: '{{{lc}}}/create/reset',
                deleteItem: '{{{lc}}}/del/del',
                delReset: '{{{lc}}}/del/reset',
                retrieve: '{{{lc}}}/update/retrieve',
                updateReset: '{{{lc}}}/update/reset',
                update: '{{{lc}}}/update/update',
                updateRetrieved: '{{{lc}}}/update/updateRetrieved',
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
