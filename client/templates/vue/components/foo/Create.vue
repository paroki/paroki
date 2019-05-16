<template>
    <v-flex>
        <c-card
            title="Data {{{titleUcFirst}}} Baru"
        >
            <v-card-text>
                <{{{titleUcFirst}}}Form
                :handle-update-field="updateField"
                :values="item"
                :errors="violations" />
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
            </v-flex>
        </c-card>
    </v-flex>
</template>

<script>

    import { createNamespacedHelpers } from 'vuex'
    import {{{titleUcFirst}}}Form from './Form'

    const { mapGetters, mapActions } = createNamespacedHelpers('{{{lc}}}/create')

    export default {
        components: {
            {{{titleUcFirst}}}Form
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

                this.$router.push({ name: '{{{titleUcFirst}}}Update', params: { id: created['id'] } })
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
