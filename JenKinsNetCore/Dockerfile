FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /app
# 定义参数
ARG env
# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore
# copy everything else and build app
COPY . ./
RUN dotnet publish -c Release -o out
FROM microsoft/dotnet:2.1-aspnetcore-runtime AS runtime
WORKDIR /app
COPY --from=build /app/out ./
EXPOSE 80
# 设置环境变量
ENV ASPNETCORE_ENVIRONMENT=$env
ENTRYPOINT ["dotnet", "JenKinsNetCore.dll"]