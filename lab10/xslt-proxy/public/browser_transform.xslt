<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Лабораторная 10</title>
      </head>
      <body>
        <label>Я  генерируюсь на стороне браузера!</label>
        <br/><br/>
        <xsl:choose>
          <xsl:when test="floats/float[last()] = -1">
            <label>Введите, пожалуйста, корректные данные.</label>
          </xsl:when>
          <xsl:otherwise>
            <table>
              <thead>
                <tr>
                  <th>Шаги</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="floats/float">
                  <tr>
                    <td>
                      <xsl:value-of select="."/>
                    </td>
                  </tr>
                </xsl:for-each>
                <tr>
                  <th>Ответ:</th>
                </tr>
                <tr>
                  <td>
                    <xsl:value-of select="(/floats/float)[last()]"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </xsl:otherwise>
        </xsl:choose>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>