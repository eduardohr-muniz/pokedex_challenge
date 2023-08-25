class ServerException {
  ServerException._();
  static final Map<int, String> _serverExceptions = {
    400: 'Bad Request (Requisição inválida))',
    401: 'Unauthorized (não autorizado)',
    402: 'Payment Required (pagamento necessário)',
    403: 'Forbidden (Acesso negado)',
    404: 'Not Found (não encontrado)',
    405: 'Method Not Allowed (método não permitido))',
    406: 'Not Acceptable (não aceitável)',
    407: 'Proxy Authentication Required (autenticação de proxy necessária))',
    408: 'Request Timeout (tempo limite da requisição)',
    409: 'Conflict (conflito)',
    410: 'Gone (desaparecido)',
    411: 'Length Required (comprimento necessário))',
    412: 'Precondition Failed(precondição falhou)',
    413: 'Payload Too Large (conteúdo muito grande)',
    414: 'URI Too Long (URI muito longo)',
    415: 'Unsupported Media Type (tipo de mídia não suportado)',
    416: 'Range Not Satisfiable (intervalo não satisfatório)',
    417: 'Expectation Failed  (expectativa falhou)',
    500: 'Internal Server Error (erro interno do servidor)',
    501: 'Not Implemented (não implementado)',
    502: 'Bad Gateway (porta de entrada ruim)',
    503: 'Service Unavailable (serviço indisponível)',
    504: 'Gateway Timeout (tempo limite da porta de entrada)',
    505: 'HTTP Version Not Supported  (versão HTTP não suportada)',
  };

  static String? exeptionEquals(int statusCode) {
    return _serverExceptions[statusCode];
  }
}

class DataPersistenceException implements Exception {}

class NoConnectionException implements Exception {}
