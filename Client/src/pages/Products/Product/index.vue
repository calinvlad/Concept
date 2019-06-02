<template>
    <div>
        <h1>{{product.name}}</h1>
        <p>From {{product.category}}</p>
        <p>Costs: {{product.price}} $</p>

        <b-form-checkbox
                v-model="showUpdate"
        >
            Update?
        </b-form-checkbox>
        <b-row align-h="center" class="mt-5" v-show="showUpdate">
            <b-col cols="6">
                <p>Update {{product.name}}</p>
                <b-form-group
                >
                <b-form-input v-model="form.name" placeholder="Name" class="mt-3 mb-3" value="hhh"></b-form-input>
                <b-form-input v-model="form.category" placeholder="Category" class="mb-3"></b-form-input>
                <b-form-input v-model="form.price" placeholder="Price"></b-form-input>

                <b-button size="md" block variant="outline-secondary" class="float-right mt-3" @click="update(form)">
                    Submit
                </b-button>
                </b-form-group>
            </b-col>
        </b-row>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                form: {
                    name: null,
                    category: null,
                    price: null
                },
                showUpdate: false
            }
        },
        methods: {
            update(data) {
                console.log('UPDATE: ', data)
            }
        },
        watch: {
            product() {
                this.form.name = this.product.name
                this.form.category = this.product.category
                this.form.price = this.product.price
            }
        },
        computed: {
            product() {
                return this.$store.state.products.listById
            }
        },
        mounted() {
            this.$store.dispatch('products/listById')
        }
    }
</script>