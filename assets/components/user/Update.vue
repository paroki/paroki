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
                        <v-icon>account_box</v-icon>
                        Profil
                    </v-tab>

                    <v-tab href="#tab-password">
                        <v-icon>lock</v-icon>
                        Password
                    </v-tab>
                </v-tabs>
            </template>
        </v-toolbar>
        <v-tabs-items v-model="tab">
            <v-tab-item value="tab-profil" darken10>
                <v-card flat>
                    <v-card-text>
                        <profile-form></profile-form>
                    </v-card-text>
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
        </v-tabs-items>
    </v-flex>

</template>

<script>
    import { mapActions, mapGetters } from 'vuex'
    import ProfileForm from './ProfileForm.vue'
    import User from "../../utils/user";
    import AdminPasswordForm from './Form/AdminPasswordForm';

    export default {
        components: {
            ProfileForm,
            AdminPasswordForm
        },

        data () {
            return {
                item: {},
                tab: null,
                user: new User()
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
            this.retrieve(decodeURIComponent(this.$route.params.id))
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
                updateRetrieved: 'user/update/updateRetrieved'
            }),


        }
    }
</script>
