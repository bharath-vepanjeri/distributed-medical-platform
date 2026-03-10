package com.medical.core.service;

import com.medical.core.dto.PaymentRequest;
import com.medical.core.dto.PaymentResponse;
import com.medical.core.exception.PaymentServiceUnavailableException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

@Service
public class PaymentClient {

  private final RestTemplate restTemplate;
  private final String paymentUrl;

  public PaymentClient(
      RestTemplate restTemplate, @Value("${payment.service.url}") String paymentUrl) {
    this.restTemplate = restTemplate;
    this.paymentUrl = paymentUrl;
  }

  public PaymentResponse createPayment(PaymentRequest request) {

    try {
      ResponseEntity<PaymentResponse> response =
          restTemplate.postForEntity(paymentUrl, request, PaymentResponse.class);

      PaymentResponse body = response.getBody();

      // Defensive check
      if (body == null || body.getPaymentId() == null) {
        throw new PaymentServiceUnavailableException();
      }
      return body;

    } catch (RestClientException ex) {
      throw new PaymentServiceUnavailableException();
    }
  }
}
