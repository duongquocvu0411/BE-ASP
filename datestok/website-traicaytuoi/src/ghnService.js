import axios from 'axios';

const GHN_API_BASE_URL = 'https://online-gateway.ghn.vn/shiip/public-api';
const GHN_API_TOKEN = '99154267-abd5-11ef-944e-7a41d7b601aa'; // Thay bằng token của bạn

const ghnApi = axios.create({
  baseURL: GHN_API_BASE_URL,
  headers: {
    'Content-Type': 'application/json',
    'Token': GHN_API_TOKEN,
  },
});

// Lấy danh sách tỉnh/thành phố
export const getProvinces = async () => {
  const response = await ghnApi.post('/master-data/province');
  return response.data;
};

// Lấy danh sách quận/huyện
export const getDistricts = async (provinceId) => {
  const response = await ghnApi.post('/master-data/district', {
    province_id: provinceId,
  });
  return response.data;
};

// Tính phí vận chuyển
export const calculateShippingFee = async (data) => {
  const response = await ghnApi.post('/v2/shipping-order/fee', data);
  return response.data;
};

export default ghnApi;
