<template>
    <div>
        <h1>New User</h1>

        <div
            v-if="isLoading"
            class="alert alert-info"
            role="status">Loading...</div>
        <div
            v-if="error"
            class="alert alert-danger"
            role="alert">
      <span
          class="fa fa-exclamation-triangle"
          aria-hidden="true" /> {{ error }}
        </div>

        <UserForm
            :handle-submit="onSendForm"
            :handle-update-field="updateField"
            :values="item"
            :errors="violations" />

        <router-link
            :to="{ name: 'UserList' }"
            class="btn btn-default">Back to list</router-link>
    </div>
</template>

<script>
    import { createNamespacedHelpers } from 'vuex'
    import UserForm from './ProfileForm'

    const { mapGetters, mapActions } = createNamespacedHelpers('user/create')

    export default {
        components: {
            UserForm
        },

        data () {
            return {
                item: {}
            }
        },

        computed: mapGetters([
            'error',
            'isLoading',
            'created',
            'violations'
        ]),

        watch: {
            // eslint-disable-next-line object-shorthand,func-names
            created: function (created) {
                if (!created) {
                    return
                }

                this.$router.push({ name: 'UserUpdate', params: { id: created['@id'] } })
            }
        },

        methods: {
            ...mapActions([
                'create'
            ]),

            onSendForm () {
                this.create(this.item)
            },

            updateField (field, value) {
                Object.assign(this.item, { [field]: value })
            }
        }
    }
</script>
