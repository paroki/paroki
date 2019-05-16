<template>
    <v-flex>
        <c-card
            title="Data Baptis Baru"
        >
            <v-card-text>
                <BaptisForm
                :handle-update-field="updateField"
                :values="item"
                :errors="violations" />
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
            </v-flex>
        </c-card>
    </v-flex>
</template>

<script>

    import { createNamespacedHelpers } from 'vuex'
    import BaptisForm from './Form'

    const { mapGetters, mapActions } = createNamespacedHelpers('baptis/create')

    export default {
        components: {
            BaptisForm
        },

        data () {
            return {
                item: {}
            }
        },

        computed: {
            ...mapGetters([
                'error',
                'isLoading',
                'created',
                'violations'
            ])
        },

        watch: {
            // eslint-disable-next-line object-shorthand,func-names
            created: function (created) {
                if (!created) {
                    return
                }

                this.$router.push({ name: 'BaptisUpdate', params: { id: created['id'] } })
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
