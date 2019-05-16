<template>
    <v-flex>
        <c-form
            v-bind="$attrs"
            :fields="fields"
            :values="values"
            :errors="violations"
            :inital-values="item"
        ></c-form>
    </v-flex>
</template>

<script>
    export default {
        props: {
            handleSubmit: {
                type: Function,
                required: true
            },

            handleUpdateField: {
                type: Function,
                required: true
            },

            values: {
                type: Object,
                required: true
            },

            errors: {
                type: Object,
                default: () => {}
            },

            initialValues: {
                type: Object,
                default: () => {}
            }
        },

        data: () => {
            return {
                fields: [
                {{#each formFields}}
                    { name: '{{{name}}}', type: 'text', label: '{{{name}}}' },
                {{/each}}
                ]
            }
        },

        computed: {
            // eslint-disable-next-line
            item () {
                return this.initialValues || this.values
            },

            violations () {
                return this.errors || {}
            }
        }
    }
</script>
