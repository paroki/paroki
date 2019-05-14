<template>
    <v-flex md12>
        <v-toolbar color="cyan" dark>
            <v-toolbar-title centered>Pengguna Baru</v-toolbar-title>
        </v-toolbar>

        <v-card flat>
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
                <v-icon left>arrow_back_ios</v-icon>
                Kembali
            </v-btn>
            <v-btn
                @click="onSendForm"
                color="success"
                :loading="isLoading"
            >
                <v-icon left>cloud_upload</v-icon>
                Simpan
            </v-btn>
        </v-card>
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
            }
        }
    }
</script>
