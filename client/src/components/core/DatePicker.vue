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
            dark
        >
            <template v-slot:activator="{ on }">
                <v-text-field
                    v-model="dateFormatted"
                    label="Date"
                    hint="DD/MM/YYYY format"
                    persistent-hint
                    prepend-icon="mdi-calendar"
                    @blur="date = parseDate(dateFormatted)"
                    v-on="on"
                ></v-text-field>
            </template>
            <v-date-picker
                v-bind="$attrs"
                v-model="date"
                no-title
                @input="handleInput"
            ></v-date-picker>
        </v-menu>
        <!--
        <p>Date in ISO format: <strong>{{ data[name] }}</strong></p>
        -->
    </div>
</template>

<script>
    export default {
        name: 'c-datepicker',
        props: {
            name: {
                type: String,
                required: true
            },
            data: {
                type: String,
                default: null
            },
            label: {
                type: String,
                required: true
            },
            format: {
                type: String,
                default: 'DD/MM/YYYY'
            },
            handleUpdateField: {
                type: Function,
                default: () => {}
            }
        },
        data(){
            return {
                menu: false,
                display: null,
                date: null,
                dateFormatted: null
            }
        },
        watch: {
            data(val){
                this.date = val;
            },
            date () {
                this.dateFormatted = this.formatDate(this.date);
            },
        },

        methods: {
            formatDate (date) {
                if (!date) return null
                date = date.substring(0,10);
                const [year, month, day] = date.split('-')
                return `${day}/${month}/${year}`
            },
            parseDate (date) {
                if (!date) return null
                const [day, month, year] = date.split('/')
                return `${year}-${month.padStart(2, '0')}-${day.padStart(2, '0')}`
            },
            handleInput(){
                this.menu = false
                this.handleUpdateField(this.name,this.date);
            }
        }
    }
</script>
