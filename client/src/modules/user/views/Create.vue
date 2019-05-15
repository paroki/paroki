<template>
    <v-flex md12>
        <c-card
            title="Pengguna Baru"
        >
            <v-card-text>
                <user-form
                    :errors="violations"
                    :initial-values="item"
                    type="create"
                ></user-form>
            </v-card-text>
            <v-btn
                :to="{ name: 'UserList' }"
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
        </c-card>
    </v-flex>
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

                this.$router.push({ name: 'UserUpdate', params: { id: created['id'] } })
            }
        },

        methods: {
            ...mapActions([
                'create'
            ]),

            onSendForm () {
                this.create(this.item)
            },
        }
    }
</script>
