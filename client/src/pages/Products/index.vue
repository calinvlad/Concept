<template>
    <div>
        <h1>Products</h1>
        <ul v-for="(product, index) in products" :key="product.productId">
            <li>{{product.name}}
                <ul>
                    <li>{{product.category}}</li>
                    <li>{{product.price}} $</li>
                    <li>
                        <b-button size="sm" @click="order(product)">Order</b-button>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</template>


<script>
    export default {
        methods: {
            order(data) {
                this.$store.dispatch('checkout/list', data)
            }
        },
        computed: {
            products() {
                return this.$store.state.products.list ? this.$store.state.products.list : []
            }
        },
        mounted() {
            this.$store.dispatch('products/list')
        }
    }
</script>

