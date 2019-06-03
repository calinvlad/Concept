import api from "@/plugins/api";
import store from '@/store'
import router from '@/router.js'

export const list = async ({commit}) => {
    const data = (await api().get('/products/list')).data
    commit('LIST', data)
}

export const listById = async ({commit}) => {
    const data = (await api().get(`/products/${router.currentRoute.params.productId}`)).data
    commit('LISTBYID', data)
}

export const update = async ({commit}, data) => {
    await api().post(`/products/images?productId=${router.currentRoute.params.productId}`,  data.formData)
    await api().put(`/products/update/${router.currentRoute.params.productId}?userId=2`, data.data)
}


export default {
    list,
    listById,
    update
}
