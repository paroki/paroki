<template>
    <div>
        <v-menu
            ref="menu"
            v-model="menu"
            :close-on-content-click="false"
            :nudge-right="40"
            lazy
            transition="scale-transition"
            offset-y
            full-width
            max-width="290px"
            min-width="290px"
        >
            <template v-slot:activator="{ on }">
                <v-text-field
                    v-model="dateFormatted"
                    label="Date"
                    hint="MM/DD/YYYY format"
                    persistent-hint
                    prepend-icon="event"
                    @blur="date = parseDate(dateFormatted)"
                    v-on="on"
                ></v-text-field>
            </template>
            <v-date-picker v-model="date" no-title @input="menu = false"></v-date-picker>
        </v-menu>
        <!--
        <p>Date in ISO format: <strong>{{ data[name] }}</strong></p>
        -->
    </div>
</template>

<script>
    export default {
        props: {
            name: {
                type: String,
                required: true
            },
            data: {
                type: [Array, Object],
                required: () => {}
            },

            label: {
                type: String,
                required: true
            },
            format: {
                type: String,
                default: 'DD-MM-YYYY'
            }
        },
        data(){
            return {
                menu: false,
                display: null,
                date: null,
                dateFormatted: null,
            }
        },
        computed: {

        },

        created(){
            const val = this.data[this.name];
            if(val){
                this.date = val;
            }
        },

        watch: {
            date () {
                this.dateFormatted = this.formatDate(this.date);
                this.data[this.name] = this.date;
            },
        },

        methods: {
            formatDate (date) {
                if (!date) return null

                const [year, month, day] = date.split('-')
                return `${day}/${month}/${year}`
            },
            parseDate (date) {
                if (!date) return null

                const [day, month, year] = date.split('/')
                return `${year}-${month.padStart(2, '0')}-${day.padStart(2, '0')}`
            }
        }
    }
</script>
