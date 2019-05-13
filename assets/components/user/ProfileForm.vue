<template>
    <v-flex>
        <c-form
            :fields="fields"
            :values="values"
            :errors="violations"
            :initial-values="retrieved"
        >
        </c-form>
        <v-btn
            :to="{ name: 'UserList' }"
            color="info"
        >
            <v-icon left>arrow_back_ios</v-icon>
            Kembali
        </v-btn>
        <v-btn
            @click="onSendForm"
            color="success"
        >
            <v-icon left>cloud_upload</v-icon>
            Simpan
        </v-btn>
    </v-flex>
</template>
<script>
    import { mapActions, mapGetters } from 'vuex'
    import User from "../../utils/user";

    export default {
        props: {
        },

        data: () => {
            return {
                fields: [
                    { name: 'nama', type: 'text', label: 'Nama Lengkap Pengguna', required: true},
                    { name: 'username', type: 'text', label: 'Username yang digunakan untuk login'},
                    { name: 'email', type: 'text', label: 'Email pengguna'},
                ],
                values: {}
            }
        },
        computed: {
            ...mapGetters({
                isLoading: 'siap/isLoading',
                error: 'user/update/error',
                deleteError: 'user/del/error',
                deleteLoading: 'user/del/isLoading',
                created: 'user/create/created',
                deleted: 'user/del/deleted',
                retrieved: 'user/update/retrieved',
                updated: 'user/update/updated',
                violations: 'user/update/violations'
            }),
            // eslint-disable-next-line
            item () {
                return this.initialValues || this.values
            },

            violations () {
                return this.errors || {}
            }
        },

        created(){
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
            beforeDestroy () {
                this.reset()
            },
            isInvalid (key) {
                return Object.keys(this.violations).length > 0 && this.violations[key]
            },
            updateField (field, value) {
                this.updateRetrieved({ [field]: value })
            },
            del () {
                if (window.confirm('Are you sure you want to delete this user ?')) {
                    this.deleteItem(this.retrieved)
                }
            },
            reset () {
                this.updateReset()
                this.delReset()
                this.createReset()
            },

            onSendForm () {
                this.update()
                    .then(() => {

                    });
            }
        }
    }
</script>
