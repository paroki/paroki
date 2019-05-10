<template>
    <b-card v-if="!isLoading" class="animated fadeIn">
        <div slot="header">
            {{retrieved && retrieved['nama']}}
        </div>
        <UserForm
            v-if="item"
            :handle-submit="onSendForm"
            :handle-update-field="updateField"
            :values="item"
            :errors="violations"
            :initial-values="retrieved"
            :fields="fields"
        />
    </b-card>
</template>

<script>
    import { mapActions, mapGetters } from 'vuex'
    import UserForm from './Form.vue'

    export default {
        components: {
            UserForm
        },

        data () {
            return {
                item: {},
                fields: [
                    { name: 'nama', type: 'text', label: 'Nama Lengkap Pengguna'}
                ]
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

        watch: {
            // eslint-disable-next-line object-shorthand,func-names
            deleted: function (deleted) {
                if (!deleted) {
                    return
                }

                this.$router.push({ name: 'UserList' })
            }
        },

        beforeDestroy () {
            this.reset()
        },

        created () {
            this.retrieve(decodeURIComponent(this.$route.params.id))
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
            },

            updateField (field, value) {
                this.updateRetrieved({ [field]: value })
            }
        }
    }
</script>
