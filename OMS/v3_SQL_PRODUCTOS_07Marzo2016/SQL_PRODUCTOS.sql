USE [AES_PICA_PRODUCTOS]
GO

/****** Object:  StoredProcedure [dbo].[PRODUCTOS_NOMBRE]    Script Date: 07/03/2016 21:41:24 ******/
DROP PROCEDURE [dbo].[PRODUCTOS_NOMBRE]
GO

/****** Object:  StoredProcedure [dbo].[PRODUCTOS_LISTA]    Script Date: 07/03/2016 21:41:24 ******/
DROP PROCEDURE [dbo].[PRODUCTOS_LISTA]
GO

/****** Object:  StoredProcedure [dbo].[PRODUCTOS_ID]    Script Date: 07/03/2016 21:41:24 ******/
DROP PROCEDURE [dbo].[PRODUCTOS_ID]
GO

/****** Object:  StoredProcedure [dbo].[PRODUCTOS_DESCRIPCION]    Script Date: 07/03/2016 21:41:24 ******/
DROP PROCEDURE [dbo].[PRODUCTOS_DESCRIPCION]
GO

/****** Object:  StoredProcedure [dbo].[PRODUCTOS_DESCRIPCION]    Script Date: 07/03/2016 21:41:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Autor:  ghemo007
-- Fecha Creacion: 20/02/16
-- =============================================
CREATE PROCEDURE [dbo].[PRODUCTOS_DESCRIPCION]
  @DESCRIPCION VARCHAR(4000)
  ,@NUMERO_PAGINA INT
  ,@TAMANO_PAGINA INT

AS
BEGIN 
	--Validación de precondiciones
	Declare @CONTEO_PAGINAS INT
	SET @CONTEO_PAGINAS = 0
	IF @TAMANO_PAGINA < 1  OR @NUMERO_PAGINA < 1 RETURN

	--Ajuste de cantidad de páginas
	DECLARE @CANTIDAD_REGISTROS INT
	SELECT @CANTIDAD_REGISTROS = COUNT(*) FROM [dbo].[PRODUCTOS] WHERE DESCRIPCION LIKE +'%'+@DESCRIPCION+'%'
 
	IF @CANTIDAD_REGISTROS = 0
		SET @CONTEO_PAGINAS = 0
	ELSE IF @CANTIDAD_REGISTROS % @TAMANO_PAGINA = 0
		SET @CONTEO_PAGINAS = @CANTIDAD_REGISTROS / @TAMANO_PAGINA
	ELSE
		SET @CONTEO_PAGINAS = (@CANTIDAD_REGISTROS / @TAMANO_PAGINA) + 1 

	--Registros paginados,filtrados y ordenados
	DECLARE @offset INT =  (@TAMANO_PAGINA * (@NUMERO_PAGINA - 1)) --SET NOCOUNT OFF;
    SELECT @CANTIDAD_REGISTROS CANTIDAD_REGISTROS,ID
    ,PRODUCTO_ID
    ,NOMBRE
    ,DESCRIPCION
    ,CATEGORIA
    ,PRECIO_LISTA
    ,FABRICANTE
    ,IMAGEN
    ,IMAGEN_URL
    FROM PRODUCTOS
    WHERE DESCRIPCION LIKE +'%'+@DESCRIPCION+'%'

   ORDER BY ID
   OFFSET @offset ROWS 
   FETCH NEXT @TAMANO_PAGINA ROWS ONLY;
END
GO

/****** Object:  StoredProcedure [dbo].[PRODUCTOS_ID]    Script Date: 07/03/2016 21:41:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Autor:  ghemo007
-- Fecha Creacion: 20/02/16
-- =============================================
CREATE PROCEDURE [dbo].[PRODUCTOS_ID]
  @ID NUMERIC

AS
BEGIN 
    SELECT ID
    ,PRODUCTO_ID
    ,NOMBRE
    ,DESCRIPCION
    ,CATEGORIA
    ,PRECIO_LISTA
    ,FABRICANTE
    ,IMAGEN
    ,IMAGEN_URL
    FROM PRODUCTOS
    WHERE (@ID IS NULL OR @ID=ID)
   ORDER BY ID
END
GO

/****** Object:  StoredProcedure [dbo].[PRODUCTOS_LISTA]    Script Date: 07/03/2016 21:41:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Autor:  ghemo007
-- Fecha Creacion: 20/02/16
-- =============================================
CREATE PROCEDURE [dbo].[PRODUCTOS_LISTA]
 @NUMERO_PAGINA INT
 ,@TAMANO_PAGINA INT
AS
BEGIN 
	--Validación de precondiciones
	Declare @CONTEO_PAGINAS INT
	SET @CONTEO_PAGINAS = 0
	IF @TAMANO_PAGINA < 1  OR @NUMERO_PAGINA < 1 RETURN

	--Ajuste de cantidad de páginas
	DECLARE @CANTIDAD_REGISTROS INT
	SELECT @CANTIDAD_REGISTROS = COUNT(*) FROM [dbo].[PRODUCTOS]
 
	IF @CANTIDAD_REGISTROS = 0
		SET @CONTEO_PAGINAS = 0
	ELSE IF @CANTIDAD_REGISTROS % @TAMANO_PAGINA = 0
		SET @CONTEO_PAGINAS = @CANTIDAD_REGISTROS / @TAMANO_PAGINA
	ELSE
		SET @CONTEO_PAGINAS = (@CANTIDAD_REGISTROS / @TAMANO_PAGINA) + 1 

	--Registros paginados,filtrados y ordenados
	DECLARE @offset INT =  (@TAMANO_PAGINA * (@NUMERO_PAGINA - 1)) --SET NOCOUNT OFF;
    SELECT @CANTIDAD_REGISTROS CANTIDAD_REGISTROS,ID
    ,PRODUCTO_ID
    ,NOMBRE
    ,DESCRIPCION
    ,CATEGORIA
    ,PRECIO_LISTA
    ,FABRICANTE
    ,IMAGEN
    ,IMAGEN_URL
    FROM PRODUCTOS
   ORDER BY ID
   OFFSET @offset ROWS 
   FETCH NEXT @TAMANO_PAGINA ROWS ONLY;
END
GO

/****** Object:  StoredProcedure [dbo].[PRODUCTOS_NOMBRE]    Script Date: 07/03/2016 21:41:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Autor:  ghemo007
-- Fecha Creacion: 20/02/16
-- =============================================
CREATE PROCEDURE [dbo].[PRODUCTOS_NOMBRE]
  @NOMBRE VARCHAR(200)
  ,@NUMERO_PAGINA INT
  ,@TAMANO_PAGINA INT

AS
BEGIN 
	--Validación de precondiciones
	Declare @CONTEO_PAGINAS INT
	SET @CONTEO_PAGINAS = 0
	IF @TAMANO_PAGINA < 1  OR @NUMERO_PAGINA < 1 RETURN

	--Ajuste de cantidad de páginas
	DECLARE @CANTIDAD_REGISTROS INT
	SELECT @CANTIDAD_REGISTROS = COUNT(*) FROM [dbo].[PRODUCTOS] WHERE NOMBRE LIKE +'%'+@NOMBRE+'%'
 
	IF @CANTIDAD_REGISTROS = 0
		SET @CONTEO_PAGINAS = 0
	ELSE IF @CANTIDAD_REGISTROS % @TAMANO_PAGINA = 0
		SET @CONTEO_PAGINAS = @CANTIDAD_REGISTROS / @TAMANO_PAGINA
	ELSE
		SET @CONTEO_PAGINAS = (@CANTIDAD_REGISTROS / @TAMANO_PAGINA) + 1 

	--Registros paginados,filtrados y ordenados
	DECLARE @offset INT =  (@TAMANO_PAGINA * (@NUMERO_PAGINA - 1)) --SET NOCOUNT OFF;
    SELECT @CANTIDAD_REGISTROS CANTIDAD_REGISTROS,ID
    ,PRODUCTO_ID
    ,NOMBRE
    ,DESCRIPCION
    ,CATEGORIA
    ,PRECIO_LISTA
    ,FABRICANTE
    ,IMAGEN
    ,IMAGEN_URL
    FROM PRODUCTOS
    WHERE NOMBRE LIKE +'%'+@NOMBRE+'%'
   ORDER BY ID
   OFFSET @offset ROWS 
   FETCH NEXT @TAMANO_PAGINA ROWS ONLY;
END
GO


