package com.medical.apigateway.filter;

import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

@Slf4j
@Component
public class LoggingFilter implements GlobalFilter, Ordered {

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {

        ServerHttpRequest request = exchange.getRequest();
        String method   = request.getMethod().name();
        String path     = request.getURI().getPath();
        String clientIp = getClientIp(request);
        String userId   = request.getHeaders().getFirst("X-User-Id");
        long startTime  = System.currentTimeMillis();

        log.info("[REQUEST]  {} {} | IP: {} | UserId: {}",
                method, path, clientIp, userId != null ? userId : "anonymous");

        return chain.filter(exchange).then(Mono.fromRunnable(() -> {

            long duration  = System.currentTimeMillis() - startTime;
            int statusCode = exchange.getResponse().getStatusCode() != null
                    ? exchange.getResponse().getStatusCode().value()
                    : 0;

            if (statusCode >= 500) {
                log.error("[RESPONSE] {} {} | Status: {} | Duration: {}ms | IP: {}",
                        method, path, statusCode, duration, clientIp);
            } else if (statusCode >= 400) {
                log.warn("[RESPONSE] {} {} | Status: {} | Duration: {}ms | IP: {}",
                        method, path, statusCode, duration, clientIp);
            } else {
                log.info("[RESPONSE] {} {} | Status: {} | Duration: {}ms | IP: {}",
                        method, path, statusCode, duration, clientIp);
            }
        }));
    }

    @Override
    public int getOrder() {
        return 1;
    }

    private String getClientIp(ServerHttpRequest request) {
        String forwarded = request.getHeaders().getFirst("X-Forwarded-For");
        if (forwarded != null && !forwarded.isEmpty()) {
            return forwarded.split(",")[0].trim();
        }
        return request.getRemoteAddress() != null
                ? request.getRemoteAddress().getAddress().getHostAddress()
                : "unknown";
    }
}