<template>
    <v-flex md12 fill-height>

        <v-toolbar color="cyan" dark tabs>
            <v-toolbar-title centered>{{ retrieved && retrieved.nama }}</v-toolbar-title>
            <template v-slot:extension>
                <v-tabs
                    color="cyan"
                    dark
                    v-model="tab"
                >
                    <v-tabs-slider color="yellow"></v-tabs-slider>

                    <v-tab href="#tab-profil">
                        <v-icon>fas fa-user</v-icon>
                        &nbsp;Profil
                    </v-tab>

                    <v-tab href="#tab-password">
                        <v-icon>fas fa-lock</v-icon>
                        &nbsp;Password
                    </v-tab>
                </v-tabs>
            </template>
        </v-toolbar>
        <v-tabs-items v-model="tab">
            <v-tab-item value="tab-profil" darken10>
                <v-card flat>
                    <v-card-text>
                        <profile-form
                            :errors="violations"
                            :initial-values="retrieved"
                        ></profile-form>
                    </v-card-text>
                    <v-btn
                        :to="{ name: 'UserList' }"
                        color="info"
                    >
                        <v-icon left>fas fa-step-backward</v-icon>
                        Kembali
                    </v-btn>
                    <v-btn
                        @click="onSendForm"
                        color="success"
                        :loading="isLoading"
                    >
                        <v-icon left>fas fa-save</v-icon>
                        Simpan
                    </v-btn>
                </v-card>
            </v-tab-item>
            <v-tab-item value="tab-password">
                <v-card flat>
                    <v-card-text>
                        <AdminPasswordForm
                            v-if="user.hasRole('ROLE_ADMIN')"
                        ></AdminPasswordForm>
                    </v-card-text>
                </v-card>
            </v-tab-item>
            <c-simple-dialog
                title="Konfirmasi Hapus Data"
                content="Apakah anda yakin ingin menghapus data ini?"
                :resolve="onDelete"
                :activator="dialogActivator"
            >
            </c-simple-dialog>
            <v-btn
                color="error"
                @click="dialogActivator = true"
                dark
                absolute
                top
                right
                fab
            >
                <v-icon>fas fa-trash</v-icon>
            </v-btn>
        </v-tabs-items>
    </v-flex>

</template>

<script>
    import { mapActions, mapGetters } from 'vuex'
    import ProfileForm from './ProfileForm.vue'
    import User from "../../../utils/user";
    import AdminPasswordForm from './Form/AdminPasswordForm';
    import CSimpleDialog from "../../../plugins/siap/SimpleDialog";

    export default {
        components: {
            CSimpleDialog,
            ProfileForm,
            AdminPasswordForm
        },

        data: () => {
            return {
                item: {},
                tab: null,
                user: new User(),
                dialogActivator: false
            }
        },

        computed: {
            ...mapGetters({
                isLoading: 'user/update/isLoading',
                error: 'user/update/error',
                deleteError: 'user/del/error',
                deleteLoading: 'user/del/isLoading',
                created: 'user/create/created',
                deleted: 'user/del/deleted',
                retrieved: 'user/update/retrieved',
                updated: 'user/update/updated',
                violations: 'user/update/violations'
            })
        },

        created () {
            this.retrieve(decodeURIComponent(this.$route.params.id));
            if(this.created){
                this.snackbarSuccess(`User ${this.created.nama} berhasil dibuat!`);
            }
        },

        beforeDestroy(){
            this.reset();
        },

        watch: {
            // eslint-disable-next-line object-shorthand,func-names
            deleted: function (deleted) {
                if (!deleted) {
                    return
                }
                this.$router.push({ name: 'UserList' })
            }
        },

        methods: {
            ...mapActions({
                createReset: 'user/create/reset',
                deleteItem: 'user/del/del',
                delReset: 'user/del/reset',
                retrieve: 'user/update/retrieve',
                updateReset: 'user/update/reset',
                update: 'user/update/update',
                updateRetrieved: 'user/update/updateRetrieved',
                snackbarSuccess: 'siap/snackbarSuccess',
                snackbarError: 'siap/snackbarError',
            }),
            onSendForm () {
                this.update()
                    .then(() => {
                        if(!this.error){
                            this.snackbarSuccess('Perubahan data berhasil disimpan!');
                        }else{
                            this.snackbarError();
                        }
                    });
            },
            reset(){
                this.updateReset()
                this.delReset()
                this.createReset()
            },
            onDelete(val) {
                if(val){
                    this.deleteItem(this.retrieved);
                }
                this.dialogActivator = false;
            }
        }
    }
</script>
