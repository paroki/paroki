<template>
    <v-flex md12 fill-height>
        <c-card
            title="Data {{{titleUcFirst}}}"
        >
            <v-card-text>
                <c-table
                    :items="items"
                    :headers="headers"
                    :pager="pager"
                    :handle-edit="handleEdit"
                    :total-items="totalItems"
                    :loading="isLoading"
                    :load-page-action="getPage"
                    :set-pager-action="setPager"
                >
                </c-table>

            </v-card-text>
            <v-flex slot="actions">
                <v-btn
                    :to="{ name: '{{{titleUcFirst}}}Create' }"
                    color="cyan"
                    dark
                >
                    <v-icon v-text="$vuetify.icons.add"></v-icon>
                    Data Baru
                </v-btn>
                <c-pagination
                    :total-items="totalItems"
                    :set-pager-action="setPager"
                    :load-page-action="getPage"
                    :pager="pager"
                    fill-height
                    :circle="true"
                >
                </c-pagination>
            </v-flex>
        </c-card>
    </v-flex>

</template>

<script>
    import { mapActions, mapGetters } from 'vuex'

    export default {
        computed: mapGetters({
            deletedItem: '{{{lc}}}/del/deleted',
            error: '{{{lc}}}/list/error',
            items: '{{{lc}}}/list/items',
            isLoading: '{{{lc}}}/list/isLoading',
            view: '{{{lc}}}/list/view',
            pager: '{{{lc}}}/list/pager',
            totalItems: '{{{lc}}}/list/totalItems'
        }),

        data(){
            return {
                headers: [
                    { value: 'actions', text: ''},
                {{#each fields}}
                    { value: '{{name}}', text: '{{name}}'},
                {{/each }}
                ],
                primaryKey: 'id',
            }
        },

        methods: {
            ...mapActions({
                getPage: '{{{lc}}}/list/default',
                setPager: '{{{lc}}}/list/setPager'
            }),
            handleEdit(item){
                this.$router.push({name: '{{{titleUcFirst}}}Update', params: {id: item.id}});
            }
        }

    }
</script>
